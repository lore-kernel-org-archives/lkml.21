Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.136
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795461543;
	b=eH2JMG+uorCEydPCAGdJf120LtMczKolmG8cA7el3koIW53+D2NprKlvWOWCxi+AtZpR
	 r/UWoLYRdg+SnOvC/6GXqWOhfrFsAXh5RYhuG81s2ZyxPMSVFVs5BbSz4pOZxmSPm/bAK
	 ZfyNCRdCV9x2mZliWlxN/aIIbvUUlCc5m14aNDsLKL28QKPVBcRdXg6vne4WFQpMMVn2C
	 yiBSFFV9uF61EFqTMrOUtJcgPVYEEvW8DAO3uNK0P/ZxUr1qMnDVa12NsrrIJ/Wz4YXnR
	 wqXljwooHd29VyG1KEW5G7zqLj2oSslTWKz5EWuCPnkh0Pl7jI0OGqEvLQbM3ptHVCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795461543;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=l0qv643AwWVG9cOQkUVDoDNhVW4tHk/WuiVyVtFsmf0=;
	b=P6PqEccYgU8ywEaS+sjRz7h09tkCh2S+tEruAWVB/QCA+rVNjwTL20IlQ8E7vsd7tBSS
	 BZeID8b5j7pPlmEuz9l2KetKfxoYuhJZ2M2xdeXli+qzaPc7wObKwLp5MM4Lc2zbpL2x6
	 DprvSMJLnau24/ks8DXP+4odSDEQbD9UJU5yVJLj6fyEDlY43NKc/PEGrERxcuqamwUAb
	 vN/ct6K3MuO3nzd541X70+E4fTPgUWu7jR6OPLH7yGfT+MCKcsocbmX04D6JYImCdq0W6
	 xh4srXvG5iZpHr6EbWDh/DjKzf9mlB8AZDwzTaAkNh19pEqYUO1r7ktMrfVgak+eKtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XDf+TPbn;
	arc=none smtp.remote-ip=74.125.231.136
Received: from mail-oo2-f8.google.com (mail-oo2-f8.google.com [74.125.231.136])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7AC5606A326
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:19:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7AC5606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XDf+TPbn
Received: by mail-oo2-f8.google.com with SMTP id 006d021491bc7-718facffeffso347736eaf.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 11:19:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795461541; x=1796066341; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=l0qv643AwWVG9cOQkUVDoDNhVW4tHk/WuiVyVtFsmf0=;
        b=XDf+TPbndKaUk7hQv5dg3of4D0O2J4Trasc6iSJA6BJLId+TiXX7b8sJllPqRpV448
         CBWuLfljSDApsAbypP3DAy4YACghuyUszgHr5G6camxt5qI0/j+sHz2eqDoNHmCivi2w
         DknCflHAEXJfJ7GSgtX58qkFZVfOH0IbBpJwsOdnP/p36nrNjyfsq0C6QvP72/YIHz1g
         gRoiBGB4jnoCSPIX47gokOvwbLDTnWYiXV9L/dZXwyKsQgG7pLdrZBWgffJJVz7AEbiD
         sDCpVVEtEi/cqQT2QsJt4JWQwi4+bL8BoXV/VcLN+NfZnAgMiMQGv8ujSLfQiAaJ1TUU
         S2jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795461541; x=1796066341;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l0qv643AwWVG9cOQkUVDoDNhVW4tHk/WuiVyVtFsmf0=;
        b=IT33Ni5AIgoAqDGNfnG/ZU1+LRbHBLRz6CdPZBvWGjNAnfu40OlXppo9YVMFLGy2ME
         bVbrreWqjoXJIPGPZzt7zH6UpkAIGD7BXm3qvVtntXIl21WNGjNKWvVjp8YFCEanGaLJ
         Jl51W/5t4s+Kf6CANpOhM/oduDdliCCELD2QaN62PgLr0XV6uIr2FC4rvcfgMR7NUPDQ
         VTpUKATjy7mYdY0BlHPiWA2dynYualWOD8yGy+z9YiCXm1TXc+d3qx8LCE1rGs0foBTU
         OGzvXBUHOSm/p7ENi6ghWbmHbeMWQA1cWf7WksumpxtT010ig608uQ2Lhf6/KQ4ZnF8J
         5msQ==
X-Forwarded-Encrypted: i=1; AL+hErH7RLDSsP/Lcuhe+bwK6nm2NRx85/vzdKcgvqlDnMRIjJORoolkUyfcJMgo69f6fmHy/WEAOKyBMU5bfQI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9zZDDdQTxrn7SRusNql1FPfTrb1/mkh9/UazylAF1kbfc1PMPS
	/6RTFmwTmasv2fYmw2K9SWyANBxswv4xrM+EjMOqYDeKRivhO/ZBhIW9MGtgC+kzNdn34A==
X-Gm-Gg: AZFdTZcqAT/PvU4llfmFy4YjdE43wixNViI47HXhNmGdr8oc5gjdhTfgxYvm2nAXjFh
	0okxnAKi4RQQdDXDKPJnEQ70eg1Lo6CuQ0H9pXDmxY92A3L7Vxp8aH/dM4bVkGnYsbA4qEJMIK4
	6Wbl10+qgvPxbP0Ntemisy6RdEM5xVZlHgSRln7/IIuZ7txA827xVEkWqESinEKT5ML4whiAM5O
	cwkX2VwtuSK1D/9Yjdh3P7lAFEksw1XTbHp9+im6N1XMRbvlZYckJCITK7mc47tR4lGN5lyZNlQ
	nAu7BkEv3+gC9pA3mG07Jgt5Rw2R8daBx5j2Zu1t4to/sqyKeD93LfMjLTdEgxz5Q2D9hSJioNR
	7geOlzaPH+edjmF91nZzUHz7Clh+/Ja9lOwFqSi5C4OkBorlJwtpoYf8TuXrpP2/Z3zuUYIUU8P
	lPkjItIHxHK7DT0JugGK5SQHrNv3fVcJnaxHAJmEcJZ1ZeCDvD9G8axKon0ZadaGlbKHpt6hm0w
	Aerw3cvWYH2tsFcgwu4yaybUdS8turW3yq2a6pZXvkAZhHrErh01Qml+s19DgN5vyMGx/Hbr238
	KByJeX0QAn5JAhtQvRJF2kx1mdBRSNidMj2mrZ78GdKHDGOIIMQe26V79ZWncg==
X-Received: by 2002:a05:6820:c451:20b0:71a:e82c:1eb5 with SMTP id 006d021491bc7-71b3920d96fmr6475933eaf.9.1795461541463;
        Mon, 23 Nov 2026 11:19:01 -0800 (PST)
Received: from fedora (c-76-142-242-58.hsd1.tx.comcast.net. [76.142.242.58])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-863168f3964sm9117818a34.14.2026.11.23.11.19.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:19:01 -0800 (PST)
From: Hezekiah Mogere Joseph Mayaka <hmjm081106@gmail.com>
To: Vaibhav Agarwal <vaibhav.sr@gmail.com>,
	Mark Greer <mgreer@animalcreek.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hezekiah Mogere Joseph Mayaka <hmjm081106@gmail.com>
Subject: [PATCH] staging: greybus: audio: Add trailing newline to sysfs show output
Date: Mon, 23 Nov 2026 13:18:49 -0600
Message-ID: <20261123191849.232589-1-hmjm081106@gmail.com>
X-Mailer: git-send-email 2.56.1
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

The show() functions for the name, vid, pid, intf_id, ip_devices and
op_devices attributes do not end their output with a newline, so
reading them with cat leaves the shell prompt on the same line.
checkpatch.pl warns about this:

  WARNING: return sysfs_emit(...) formats should include a terminating newline

Add the missing newline, matching the other greybus sysfs attributes.

Signed-off-by: Hezekiah Mogere Joseph Mayaka <hmjm081106@gmail.com>
---
 drivers/staging/greybus/audio_manager_module.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/greybus/audio_manager_module.c b/drivers/staging/greybus/audio_manager_module.c
index 8a9f7e7d1766..2ec56f19b8ec 100644
--- a/drivers/staging/greybus/audio_manager_module.c
+++ b/drivers/staging/greybus/audio_manager_module.c
@@ -75,7 +75,7 @@ static void gb_audio_module_release(struct kobject *kobj)
 static ssize_t gb_audio_module_name_show(struct gb_audio_manager_module *module,
 					 struct gb_audio_manager_module_attribute *attr, char *buf)
 {
-	return sysfs_emit(buf, "%s", module->desc.name);
+	return sysfs_emit(buf, "%s\n", module->desc.name);
 }
 
 static struct gb_audio_manager_module_attribute gb_audio_module_name_attribute =
@@ -84,7 +84,7 @@ static struct gb_audio_manager_module_attribute gb_audio_module_name_attribute =
 static ssize_t gb_audio_module_vid_show(struct gb_audio_manager_module *module,
 					struct gb_audio_manager_module_attribute *attr, char *buf)
 {
-	return sysfs_emit(buf, "%d", module->desc.vid);
+	return sysfs_emit(buf, "%d\n", module->desc.vid);
 }
 
 static struct gb_audio_manager_module_attribute gb_audio_module_vid_attribute =
@@ -93,7 +93,7 @@ static struct gb_audio_manager_module_attribute gb_audio_module_vid_attribute =
 static ssize_t gb_audio_module_pid_show(struct gb_audio_manager_module *module,
 					struct gb_audio_manager_module_attribute *attr, char *buf)
 {
-	return sysfs_emit(buf, "%d", module->desc.pid);
+	return sysfs_emit(buf, "%d\n", module->desc.pid);
 }
 
 static struct gb_audio_manager_module_attribute gb_audio_module_pid_attribute =
@@ -103,7 +103,7 @@ static ssize_t gb_audio_module_intf_id_show(struct gb_audio_manager_module *modu
 					    struct gb_audio_manager_module_attribute *attr,
 					    char *buf)
 {
-	return sysfs_emit(buf, "%d", module->desc.intf_id);
+	return sysfs_emit(buf, "%d\n", module->desc.intf_id);
 }
 
 static struct gb_audio_manager_module_attribute
@@ -114,7 +114,7 @@ static ssize_t gb_audio_module_ip_devices_show(struct gb_audio_manager_module *m
 					       struct gb_audio_manager_module_attribute *attr,
 					       char *buf)
 {
-	return sysfs_emit(buf, "0x%X", module->desc.ip_devices);
+	return sysfs_emit(buf, "0x%X\n", module->desc.ip_devices);
 }
 
 static struct gb_audio_manager_module_attribute
@@ -125,7 +125,7 @@ static ssize_t gb_audio_module_op_devices_show(struct gb_audio_manager_module *m
 					       struct gb_audio_manager_module_attribute *attr,
 					       char *buf)
 {
-	return sysfs_emit(buf, "0x%X", module->desc.op_devices);
+	return sysfs_emit(buf, "0x%X\n", module->desc.op_devices);
 }
 
 static struct gb_audio_manager_module_attribute
-- 
2.56.1

