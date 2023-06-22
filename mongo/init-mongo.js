db.system.js.save(
    {
      _id: "deleteOldData",
      value: function() {
         const currentDate = new Date();
         const thresholdDate = new Date(currentDate.getTime() - (5 * 60 * 1000)); // 5 minutos en milisegundos
         
         db.sessio.deleteMany({ data: { $lt: thresholdDate } });
      }
    }
 );
 
 db.createCollection("deleteOldDataJobs");
 
 db.deleteOldDataJobs.insertOne({
   name: "deleteOldDataJob",
   schedule: {
     interval: 5 * 60 * 1000, // 5 minutos en milisegundos
     nextRunAt: new Date(),
     active: true,
     jobId: ObjectId()
   },
   task: "deleteOldData()"
 });
 
//db.session.createIndex({"creation_date":1}, {expireAfterSeconds: 300})
