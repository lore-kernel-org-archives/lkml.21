Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795186775;
	b=yMExBUsre58Z+D09OgGNwaE1D7Z4H24tjAhkbI5M2vyrdtq4tGWnb2jrfKqO370xSL8H
	 rrdgydrJSPlTOW6rgUcn6mYiCbPYn1Eg1liKAi7gGvEllBqzANDMko2AXhpoI8eW/Rf0R
	 Oftunr0DbdAZRQeU8hehaFsVhSFCHA8J8OSm/dPGrPb81YWtlEj3qyIF/yhuJ4kNsM0SN
	 p0aU/XSP95ASQu1MLuOElE/4YV/vhRXB8JbMwoNry/g1gfp9YJZ0lx5XZPTzGFcC5bCOi
	 DBTc+DELQswft6iscUxsVBBqFeZ1ZJsZVbryDtlz6+oQqy5rQJegfUv+Omr+qXKOs4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795186775;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=/2B3N92JeCLp37cUkot9r5Ww3+X+aqaiHxpJjgbEt8g=;
	b=q1Fb7PS/ZYgLHoV64QxJV9QoJTNF7knEJ7tMReepS+9F5IIJyeAVk3PyFgVuHaA5NUzx
	 2lz95CzHImjOgvq85jGRmk8DcWBF9Svdb6QEuHNADPRWpGdHastLbwRnoy8h35Jv2Zbue
	 IHaBknoNr1nI1Qocyiqs4Piu45r/bOZFU8S9+3BNcOA3mE5tVhaRCzId+d+5HnWnYEfL1
	 OY7Di7zODnb/HZQvrZ3BjTWyCNk6BKiH136Rqx3ngRqBGIdPKzn6wt2MOhp2hAMEc7pwa
	 el9qqNp5e20asQiu8s1UDc9AWtmERaC+2Kmu4sQJ67X5/CPQc0bRKsR6XD4NF4QT+8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VnHzZ7ZI;
	arc=none smtp.remote-ip=209.85.214.174
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D415360A2616
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 14:59:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D415360A2616
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VnHzZ7ZI
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2f0426a65e0so6404355ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 06:59:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795186774; x=1795791574; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/2B3N92JeCLp37cUkot9r5Ww3+X+aqaiHxpJjgbEt8g=;
        b=VnHzZ7ZI36s1+djRXZvfUxzoDn/zbni1raIRXZL3Iea3xR3PFKmoSxDj/poAr2SnTX
         puxyyZWwl+1jYdFlin+O0YbOlVPdQd2mdtym8hpQJhj+Nck/q0gKDt6jpLfKaYPtqKx9
         vGC0YU8ENnX95i7CjSL8r0ev7OtBSpQV8mdt2cjrBm3BrmJqRZLICajoY9yzqgg8t/T6
         bTAlTQi/dS1HRGi0yoooBrbn43gSn6u5y021WA5H2baq6WcQF5Izfi4/domb7BTjnQmP
         ZOeG66OlL7pIbSg1v4oEdEqh+BbGMm9cN4WFnCXCt1D+WvvTOkmPjBq5PJyhc6j29w+S
         VlYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795186774; x=1795791574;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/2B3N92JeCLp37cUkot9r5Ww3+X+aqaiHxpJjgbEt8g=;
        b=rlMaiqOBnNoibvMzr/iyYIf/7hBAPM7gMXJa4YnMfOYaTk2RTfcnlNfrAQ8fZAHXVQ
         3ZmmAhNFADZZPzftf/m8gt5rxhyEUncBsSBULMCX4LRpPEOstMHQqrVkFaP6Z+nAjIxo
         eSHJ4WYzJrYehT+CNp+eYZdnNyfwv96y2/8ht4auFPESjAMS8eUDhEdhjqGJDeTYo8Ke
         t3cwNYE2krpPpeiacKuNsh2Z0S1CboVH/1/qyhWtnwoluJnhZp0tbjIopdG9b/B5aSI1
         Cq3QD/PnUGJFVbbAaS0q7O7jVfYq825CiE0hUD/ti+zwbIA3q/+DzecsWu4tuwvaLbF1
         onyQ==
X-Forwarded-Encrypted: i=1; AL+hErEVr0iOMJh5VVYJZp/4bgtpPij5ZsEHSj0wohsXD7NsqsInwTuj4CR+AQgiAqyOGSzjs+cKHAiLxDd2RqA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Dvbb3TeZRrz5hKuFk4bt2sHLnvLMaAP57dFI3EjEN8WfeMOvo
	S2VdithZOaT7k1cK3dzQ6dofVRzn3Bz4VZ/fYxGsa9NG4Q4tvS04efZB
X-Gm-Gg: AZFdTZfRDPYNV+GIo2OjqQ0agGfEQWZgooAnQlgn9f6CFQtBAt7pVYC/FFEMj0VDEgZ
	XOaDis7r5wO7MYe4b7hGgNicyXfUGL9oV7OeYdGWVHLNEI69QTNBNH3/0ceJTcNhNwRQLD+x8RC
	cmCqNyPNF43toGtM+2L+Y5D89cq6WyplNaVoFcinQm9aQqcshu+EsRKp4Vc+yebh4iDqQO69/fO
	PcEPOZr4Toy/0gcv2/B8Y3FeQC0YGD4mx2SzzOokOdfiHxi3iSifSW+rUwqLtDOwBzjfM8X263o
	UNphYl3vUwTtTg4aPzx9VNcyhZHeMc0HCm6w1XQjjnovSnmbr0JLmldJ9s4yH3FD0hPmaKiN09E
	Jo+R9HLC68+SNdEpG0mNJUSE10sGns9nUwriSJUAw7DOq7Mz5cscjFtmpFX4teEDWHA8wR6n7Aq
	2/gabneEY9Q2oqKureThrKwpGAmG29Jg/PhoKpUfSXzHpgI3mdajI4heFXMRyqBsJ8p41WMSA0N
	J+1R5ikmwy17c2ddl/3EA+MF8bI/sVuvBEXgO23+nJIBXKboTfPBkY6B9J1abkg+5p8tZUvvfoX
	WYYMIKX8/xikAV7OybKWJqH7sUPSZJU4Z3kU2tO9HuaQ2WxUug9pHOiZFBl5fuVYWg7QD+BevQ=
	=
X-Received: by 2002:a17:903:2f90:b0:2df:ad58:cf54 with SMTP id d9443c01a7336-2f03f2158a7mr33050395ad.34.1795186773939;
        Fri, 20 Nov 2026 06:59:33 -0800 (PST)
Received: from ubuntu ([110.9.142.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0ddf40sm15264265ad.37.2026.11.20.06.59.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 06:59:33 -0800 (PST)
From: Sang-Heon Jeon <ekffu200098@gmail.com>
To: "Theodore Ts'o" <tytso@mit.edu>
Cc: Andreas Dilger <adilger.kernel@dilger.ca>,
	Baokun Li <libaokun@linux.alibaba.com>,
	Jan Kara <jack@suse.cz>,
	linux-ext4@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ojaswin Mujoo <ojaswin@linux.ibm.com>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	Zhang Yi <yi.zhang@huawei.com>
Subject: [PATCH v2] ext4: fix wrong unit of ratelimit_interval_ms sysfs attributes
Date: Fri, 20 Nov 2026 23:59:22 +0900
Message-ID: <20261120145923.1143594-1-ekffu200098@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The interval of ratelimit_state is in jiffies. But the
ratelimit_interval_ms sysfs attributes are read and written without
converting the interval, so the values are in milliseconds only if HZ
is 1000.

If HZ is 250, the default interval of 5 seconds is read as 1250, and
writing 5000 sets the interval to 20 seconds.

So use jiffies_to_msecs() and msecs_to_jiffies() when reading and
writing. Also reject values which are too large for the interval.

Fixes: efbed4dc5857 ("ext4: add ratelimiting to ext4 messages")
Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
Reviewed-by: Jan Kara <jack@suse.cz>
---
Changes from v1 [1]
- Add comment to EXT4_RATELIMIT_INTERVAL_MAX_MS suggested by Jan
- Add reviewed-by tag by Jan

[1] https://lore.kernel.org/all/20261116161701.3664310-1-ekffu200098@gmail.com/

---
 fs/ext4/sysfs.c | 24 +++++++++++++++++++++---
 1 file changed, 21 insertions(+), 3 deletions(-)

diff --git a/fs/ext4/sysfs.c b/fs/ext4/sysfs.c
index 923b375e017f..a005c6fea48c 100644
--- a/fs/ext4/sysfs.c
+++ b/fs/ext4/sysfs.c
@@ -33,6 +33,7 @@ typedef enum {
 	attr_mb_order,
 	attr_feature,
 	attr_pointer_pi,
+	attr_pointer_pi_msecs,
 	attr_pointer_ui,
 	attr_pointer_ul,
 	attr_pointer_u64,
@@ -215,6 +216,12 @@ static struct ext4_attr ext4_attr_##_name = {			\
 #define EXT4_RW_ATTR_SBI_PI(_name,_elname)      \
 	EXT4_ATTR_OFFSET(_name, 0644, pointer_pi, ext4_sb_info, _elname)
 
+/* Limit value so that we fit into int after a conversion to jiffies */
+#define EXT4_RATELIMIT_INTERVAL_MAX_MS	(INT_MAX / DIV_ROUND_UP(HZ, MSEC_PER_SEC))
+
+#define EXT4_RW_ATTR_SBI_PI_MSECS(_name, _elname)	\
+	EXT4_ATTR_OFFSET(_name, 0644, pointer_pi_msecs, ext4_sb_info, _elname)
+
 #define EXT4_RW_ATTR_SBI_UI(_name,_elname)	\
 	EXT4_ATTR_OFFSET(_name, 0644, pointer_ui, ext4_sb_info, _elname)
 
@@ -258,11 +265,11 @@ EXT4_RW_ATTR_SBI_UI(mb_stream_req, s_mb_stream_request);
 EXT4_RW_ATTR_SBI_UI(mb_max_linear_groups, s_mb_max_linear_groups);
 EXT4_RW_ATTR_SBI_UI(extent_max_zeroout_kb, s_extent_max_zeroout_kb);
 EXT4_ATTR(trigger_fs_error, 0200, trigger_test_error);
-EXT4_RW_ATTR_SBI_PI(err_ratelimit_interval_ms, s_err_ratelimit_state.interval);
+EXT4_RW_ATTR_SBI_PI_MSECS(err_ratelimit_interval_ms, s_err_ratelimit_state.interval);
 EXT4_RW_ATTR_SBI_PI(err_ratelimit_burst, s_err_ratelimit_state.burst);
-EXT4_RW_ATTR_SBI_PI(warning_ratelimit_interval_ms, s_warning_ratelimit_state.interval);
+EXT4_RW_ATTR_SBI_PI_MSECS(warning_ratelimit_interval_ms, s_warning_ratelimit_state.interval);
 EXT4_RW_ATTR_SBI_PI(warning_ratelimit_burst, s_warning_ratelimit_state.burst);
-EXT4_RW_ATTR_SBI_PI(msg_ratelimit_interval_ms, s_msg_ratelimit_state.interval);
+EXT4_RW_ATTR_SBI_PI_MSECS(msg_ratelimit_interval_ms, s_msg_ratelimit_state.interval);
 EXT4_RW_ATTR_SBI_PI(msg_ratelimit_burst, s_msg_ratelimit_state.burst);
 #ifdef CONFIG_EXT4_DEBUG
 EXT4_RW_ATTR_SBI_UL(simulate_fail, s_simulate_fail);
@@ -434,6 +441,9 @@ static ssize_t ext4_generic_attr_show(struct ext4_attr *a,
 		if (a->attr_ptr == ptr_ext4_super_block_offset)
 			return sysfs_emit(buf, "%u\n", le32_to_cpup(ptr));
 		return sysfs_emit(buf, "%u\n", *((unsigned int *) ptr));
+	case attr_pointer_pi_msecs:
+		return sysfs_emit(buf, "%u\n",
+				  jiffies_to_msecs(*((unsigned int *) ptr)));
 	case attr_pointer_ul:
 	case attr_err_report_sec:
 		return sysfs_emit(buf, "%lu\n", *((unsigned long *) ptr));
@@ -509,6 +519,14 @@ static ssize_t ext4_generic_attr_store(struct ext4_attr *a,
 			return -EINVAL;
 		*((unsigned int *) ptr) = t;
 		return len;
+	case attr_pointer_pi_msecs:
+		ret = kstrtouint(skip_spaces(buf), 0, &t);
+		if (ret)
+			return ret;
+		if (t > EXT4_RATELIMIT_INTERVAL_MAX_MS)
+			return -EINVAL;
+		*((unsigned int *) ptr) = msecs_to_jiffies(t);
+		return len;
 	case attr_pointer_ui:
 		ret = kstrtouint(skip_spaces(buf), 0, &t);
 		if (ret)

base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
-- 
2.53.0

