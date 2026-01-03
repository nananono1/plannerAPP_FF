const admin = require("firebase-admin/app");
admin.initializeApp();

const calculateRankings2 = require("./calculate_rankings2.js");
exports.calculateRankings2 = calculateRankings2.calculateRankings2;
const updatePointsOnAdminCheck2 = require("./update_points_on_admin_check2.js");
exports.updatePointsOnAdminCheck2 =
  updatePointsOnAdminCheck2.updatePointsOnAdminCheck2;
const setLockedAt = require("./set_locked_at.js");
exports.setLockedAt = setLockedAt.setLockedAt;
const unlockUsers = require("./unlock_users.js");
exports.unlockUsers = unlockUsers.unlockUsers;
const getActiveUsersAndDetailsByDateRange = require("./get_active_users_and_details_by_date_range.js");
exports.getActiveUsersAndDetailsByDateRange =
  getActiveUsersAndDetailsByDateRange.getActiveUsersAndDetailsByDateRange;
const updateUserData = require("./update_user_data.js");
exports.updateUserData = updateUserData.updateUserData;
const newCloudFunction = require("./new_cloud_function.js");
exports.newCloudFunction = newCloudFunction.newCloudFunction;
const updatePointsOnAdminCheck4 = require("./update_points_on_admin_check4.js");
exports.updatePointsOnAdminCheck4 =
  updatePointsOnAdminCheck4.updatePointsOnAdminCheck4;
