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
const generateFeedbackOnCreate = require("./generate_feedback_on_create.js");
exports.generateFeedbackOnCreate =
  generateFeedbackOnCreate.generateFeedbackOnCreate;
