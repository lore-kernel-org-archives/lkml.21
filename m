Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795444864;
	b=3jxbMnOzETL7sYiWe3qUshx6LN0v4hCaSQKgnJb0i+nx5QeD3m0tOj0lq5MHxjRelySx
	 It6U1aajJE0HX7bQFnBgx8j1AHCQby2pTBVjXPabng76MANbz0GbHB/BIicMs404Lo3c9
	 4ZJI5W2sytmizzRU3KSlnohtd5EC7NMEOX552unsEY2BRoqAKiZzAKqTWZEZ8toa7NAEE
	 BdwQkZdcRZarZnXn3odVQtcGGn0gv0BZpiahdeWQGN/g8u1QBf2y/kZ7kWFBByRM+N7Cg
	 xkl5jjCyVX7MKEJgJTDx3Fw/R/bg1UvH0DMi3RrqOYJBEILzr+2j4dYZH9Bp7QHTK4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795444864;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=vHYFS/XA42NItihDfLyNk8KqlgIS2lvi89C3pwr65eA=;
	b=nI+0fALM6iQkY6aQ2T8Q5428cA9bfOMKc9BVAWuUMlK/bunaJdaS6+6J+2rjcJTC7xvN
	 lfPujb2HE+zUi2ZtKKdYTyr20D7R3He7XbGwABZOT/wHffukojf7dJpmVBACqzesG4CLk
	 Iol3qBeUGtewWd5tA9oychC5VGKugZZaeE+JhnmzDnaWQOvLjyBaI7kiKdPgwrBw3cnCW
	 eVw3tHiJKqpalbyrwOpfcpqRHxme7MLr/ah5nSX8Bq85r6ft5x2L9Tq181EP0VKgw8AqE
	 LfvybzSKo8HUM1fMrXj9jntZSoxPEJuskJk5dPy2qIMIT3bylXKgB/CmVXpnTBACF0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xQMB1FYg;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5309D606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 14:41:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5309D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xQMB1FYg
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so3291159f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 06:41:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795444863; x=1796049663; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vHYFS/XA42NItihDfLyNk8KqlgIS2lvi89C3pwr65eA=;
        b=xQMB1FYgXjMbbhaCDgYRq09pwx97QiOtpWMWpmB+OZxJbMTzccyRRkpIRYvt14Jo/6
         pgCK3zQNETdBzjPupSYCt4kDQPj6B4wR6Z516+u+8wVzx5rEccyApEmJhRltqCTkOn37
         cWzV9zrACJFi62oPv9pIvpaP+T/y2silz8rxl5T0Slprk95JuYb5M0o33IA+FmljMjBw
         jbvhVqetIKl19twuXi2b0dt+ml65wZlq2oNV1iSdWgKNO/ZXUwQsV2XwthRZUEpXESeT
         fslDH3nxr3xbkp9D/GJV4xNvUbVUzSyNu0cpCFjHfcDJ9XPMZJlcCApomDFmXY0IaTMF
         DMNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795444863; x=1796049663;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vHYFS/XA42NItihDfLyNk8KqlgIS2lvi89C3pwr65eA=;
        b=xLVmWfOb+eeQivw1xMRbwCJ6dDvSqhjBxpFlqLxm6vPGnM+HmvYodM/gFNmimubTTf
         UZcjzijx0pm85/xzDDmirOyCz2f7MZiCPTtUfwf8SIIKL1rYmBcgnKGtdNeH3RGG8jS1
         xg5IOYyjIXFDMmsPkudFkJ/n0QJeUq9n5gqQi8yEFNciA09UX5KKMANymS8z7yCEHnhg
         m1LSEq0FsoBsi5+y/Vd2ImWm9DWmCoraH6VG760GZrUm7oak/MySm/fJt5sP0KFUlRf0
         vvt0yRi0HktG3jOpYT4xF55NxB4XrCa3gaskOtsFyK61DOFYl4YrdRG0m4CWcV/jZHp+
         4M7g==
X-Forwarded-Encrypted: i=1; AL+hErH1BB1zP0Z1IBVsyQ3WehnwjZiXo75oNEuPI1g5QmaeczcSSh7J97iPbkOuF4dk5d6fMWJ5Oc73tzy2t30=@vger.kernel.org
X-Gm-Message-State: APuU4Z/yeJhft5WQkKAuZWxbtGlWlZLlUptfIzC5VTyVMvwWA20AH1J2
	UYL1e20XioZQ772c+1Awk8qU9XxhKQ349alIzgHcuNs53a0kCiImL8bN
X-Gm-Gg: AZFdTZcBVWkPJ/VG61fcOhVPc/fm/82LhE2ax+dXm56PF1m6vHS8ZmvCw4353iBDvTA
	608TaxLHKZ2W0vs5zGBhElHu8yLvazNy4bU+jVK0108VGz1PrKLC8RLBJrRGitCkMxPVQ2WRL+o
	qIurFsWQZuUd3XEgNVRa5eiwjo9zLnUQKnx7JFPcUjziharyUWI0AwiBSJGaqkQc2fWKtNfzaJ+
	u6wUrJzshoFpsy+ezqbrC6EuCuHVbiiVwrBer2Y23sObqBDGjvYYG8CYoyYafREP59L/MlLh3Px
	cdnlcdCLL6U06rBxqWtEgu3PcLm6q56uuXYr3DOa9RiKOL/VBaKXmtasKzrjq7cpLphqY8AIcjE
	9yBqlleG280cLAuhoKuBy89hqz4ISs9/F/oNWKKteCCSapiRleKQRR9bvioN8IjLeQRDllQxj3P
	tkExTaoW/dU8hUNpXI+qjFShRdsx/PI8DOnuA2amGBsOpoA8OIJ5wT0R44Gx3Spwmx5jA30Q/mL
	Wzra+u3jsTyxSei7KZzvXZNvkU5wGDKYpFqwU7fzB8TW+o0m1f2ucajSw5gAtR3NXee0XorXTjc
	3zGMcDuUTCuG7pBtgnZ6AO/LLQgXhXlb9ZLIxy9kEajgL9aC8WHnIc5L8W6CvM3y5bHuJ4FnqL0
	KqhSWvWNIDof7q7qP4865KvYETEfbgpEJ
X-Received: by 2002:a5d:5f4c:0:b0:48e:5d33:da5c with SMTP id ffacd0b85a97d-4abad5aca65mr22742777f8f.1.1795444862527;
        Mon, 23 Nov 2026 06:41:02 -0800 (PST)
Received: from Alone ([2407:1400:aa0f:8050:aae2:91ff:fe57:5e15])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fe75sm25598524f8f.24.2026.11.23.06.40.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:41:02 -0800 (PST)
From: Chhabilal Dangal <yogeshdangal66@gmail.com>
To: Vaibhav Agarwal <vaibhav.sr@gmail.com>,
	Mark Greer <mgreer@animalcreek.com>
Cc: Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dan Carpenter <error27@gmail.com>,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Chhabilal Dangal <yogeshdangal66@gmail.com>
Subject: [PATCH v2] staging: greybus: audio_manager_module: add terminating newlines to sysfs output
Date: Mon, 23 Nov 2026 20:25:42 +0545
Message-ID: <20261123144042.60090-1-yogeshdangal66@gmail.com>
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

The sysfs show callbacks for name, vid, pid, intf_id, ip_devices and
op_devices print their value without a trailing newline, so a read
from userspace runs into the next line.  Other sysfs attributes end
with a newline.

Line-oriented readers treat an unterminated final line as incomplete:
read(1) returns failure while still filling the variable, and wc -l
reports zero lines for the file.

These attributes have no Documentation/ABI entry and no in-tree
readers.  Adding the newline does change the user-visible output, so
it is an ABI change for any out-of-tree consumer that reads the raw
value.  Please drop the patch if that is not acceptable.

Signed-off-by: Chhabilal Dangal <yogeshdangal66@gmail.com>
---
v2: State that the output change is user-visible and may affect
    out-of-tree readers, as pointed out by Dan Carpenter. No code
    change from v1.

 drivers/staging/greybus/audio_manager_module.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/greybus/audio_manager_module.c b/drivers/staging/greybus/audio_manager_module.c
index dc90cc2d2..5737f2a32 100644
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

