Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795164262;
	b=fW6sb3C6vNehOn3zHBL6+0U7aeCYD3i8NKdznBCE6/51pA/q1OiRV1ZQQKx/V/aM+4t8
	 41GETwkDOgv3BE5J4xILjJfHfRTRh3wPizcYaRJIM0aJtH1LbSwJPYSYRm6RODWg8NCPe
	 WEsQTzERMDao5ByTLG7Y0k/uLiIkoRe4zN9jeQDQqJe2j63KYlahAKPkkIzqtnIPGV3aR
	 yEJYFCAoLbeyiMX88jw8fTZeH5zSuO4AUDnE/OD46raDwTmF1m2FlaWLgTwXaVQx9PoM0
	 SrLmVbN5sQ//3a0/cB0aJHld5D3Ie+BAK0Hd2MjWtL3Xyiszg3BapWrzOh/n7HwBa8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795164262;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=POXQs8/bvcwJtb5f0JOhZ5aKSc9OHdJOKoz1MYA1t1s=;
	b=el+kISYxhWxrNVjRkRb/0yYdMEMt4Ym5bSKIZGYC57FOR1V2xl2TTRj4rz3ZnAKDSjOA
	 GbX93Iotr0XfSnlZJ/tUfdIs7Nd/f97IB+hHKuhj7ss+2sFOyIyT3I3hzZRtU+wU1Vhdu
	 mpa3wbmREToh7gewI0WXqzm3XRNbJ0Nu8+TQHIFe7H+NkXudek5LrFTdRdUXLXfBehGwU
	 jlUSfqSOK3OsT6jAmRiKT/l1vtLWDg2f2I3+YRyHYU4gd12op3jyxL5yJbkAIA/eln0Rc
	 XuG0tSycnQVhQc4LxxnsY5gZNklPOABBTrKeVYpZV4sOT7PzXbhKK7iiscp0l5m3SYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sXrcX1os;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3557260A381D
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 08:44:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3557260A381D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sXrcX1os
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1ae58d17cd9so659479c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 00:44:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795164261; x=1795769061; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=POXQs8/bvcwJtb5f0JOhZ5aKSc9OHdJOKoz1MYA1t1s=;
        b=sXrcX1osiudBBD563TfYgC7veJdPV5WIHKVarPuI6YaUsA+djpOQZNEG+IgyL20vgz
         FdwPWO6tQLLTo5n7AftI1z+0a8+DUHjHjggiLfbRfj/1m34tb0weBU1wWZ1afgQf/5Rw
         GGjZ9Uxt5Rv4p3tSHz2jHSOLHPb6kVwBj5CyloJi7Z09jw3uxnPyBBo0R4KjI6lnMxdc
         fjv9l7DOBE2tO4T6TfTLCEc68j2FleSg1s3qVvmdj1MIJnw565y+VZdi7JzrfOeERFuD
         c+9Le2OTOHm141tSqP/bAFqwCwro+OYu/sJfJwPSMsKy+JW6p5x+Srthz8Tc3PfQpbod
         ZQMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795164261; x=1795769061;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=POXQs8/bvcwJtb5f0JOhZ5aKSc9OHdJOKoz1MYA1t1s=;
        b=Gla9YYViysjfreAm4kLjfZhVqzXn3Xiw6DloS7pWZk0IexY7c0MrpDq+q1+7X5n4Iu
         mlBCHGMuwD3nVXlqE830PMHLsPCpSn5iBilcGHjvoBwNqSKzmXnD8mkpftF+sLoan4fO
         qJHNSJcjG0/A0aTCfixUVBtPL6kdTA0x5nC8676vtK0wa00TPPbF/2nE6jsB1xJha6nP
         Rq0LMTHNF/n5FYYPOV569ZgzubV9oJwli0nfAE1E4+EIaNP6BOFVp0hOmjYi0jUN9sHP
         k/AcIEbxXe5zFFxGkTmuOnNVt3UszacIpK4C+5t9F97avAVpJN10FwY7lScfKxrngzUU
         aSkw==
X-Forwarded-Encrypted: i=1; AL+hErF/aj8XXmKowZowUulg0mOvOnp7Qt22Di/YTf1572eFjWqUEX5UumwZrv7jqcdmukkbmgpQhiqj3ByhL0I=@vger.kernel.org
X-Gm-Message-State: APuU4Z8sekRmxUAlI2QdFXyfLICvte0inoSj9qwz1rsqc/3TZoFDt2dc
	j74vSuNoEQGz6gzgExHdpZbpTXg5aFT4iNZIAeKK6JHt/5QJbj+dShZ6
X-Gm-Gg: AYBFou0rN/8WljDUkum3wKF9TsSSNTQ19BQG6vDJ1rKEct9ou7+8AIdurgZ4FOA/WK7
	BcuCWO4cTIb4p8/LOpBtypJPveeCsriqVpi8dJ45JDspXwzoYbC9YvnSY0HLVHo5HovH7z6DxpC
	AAqqqbWLwwg/4WDuf3PYyG0q+aBT29s6e3fOB7Db9WKwONEhZNYDqIttIykviXgExr0VB+LC6lj
	6GI8LMtHH71UtNHBZ9Q2wfmLxUQXW+8f/zQjKjz0MnjG9GmPwAnF5gZDZLiK8pKi++eFHWu1oMK
	M8oxQxXhzHgsyxYwKmy72xUtFq6bFLEuKzCdpHGDYu994zhuN423hch7B5RsoKH7G01UaUv6bM5
	+vy+afPWaKKgoEW0xcG0lz0NnBTa8bMzO6lkPkGthafl4s125uyAhAdnJtomajc8lt0mVvKtpMp
	SIqFFBSymD63Ie4luPLtxEXwrDVwj2y76buKDyavBVf65wy2TWvJuvszCTUfyNAO5zQdue3klmM
	Li+aquFgeVNuIJ54KT1AHOgSBcgpTxkbcg1ii9efmuZzk1xvWAMCrralM0sD3vMAC5XYzTMytkh
	aoanNHXHCI/nyYqao+pIvZh4Jjmi7DQhO7+zWemjHYgYwJugdnodVZ31VQTYiKuJxLb2ZkFx+6V
	2FqOO9EKxhWQsp+Q92Q==
X-Received: by 2002:a05:7022:7f0f:b0:1b5:22fb:848d with SMTP id a92af1059eb24-1b55688b93fmr2255492c88.16.1795164261132;
        Fri, 20 Nov 2026 00:44:21 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:ea97:e47d:2ebc:210c])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5569bffd2sm4808244c88.0.2026.11.20.00.44.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 00:44:20 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Fri, 20 Nov 2026 00:43:58 -0800
Subject: [PATCH v3 07/18] HID: logitech-hidpp: execute G920 range sysfs
 store synchronously
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-hid-logitech-hidpp-next-v3-7-ba39242d4336@gmail.com>
References: <20261120-hid-logitech-hidpp-next-v3-0-ba39242d4336@gmail.com>
In-Reply-To: <20261120-hid-logitech-hidpp-next-v3-0-ba39242d4336@gmail.com>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Gideon Heinz <gideonheinz02@gmail.com>
Cc: =?utf-8?q?Filipe_La=C3=ADns?= <lains@riseup.net>, 
 Bastien Nocera <hadess@hadess.net>, Hans de Goede <hansg@kernel.org>, 
 Edwin Velds <e.velds@gmail.com>, 
 Stuart Hayhurst <stuart.a.hayhurst@gmail.com>, 
 Andrey Smirnov <andrew.smirnov@gmail.com>, linux-input@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.17-dev-6b8b8

Writing to the G920 range sysfs attribute currently queues an
asynchronous work item to issue the HIDPP_FF_SET_APERTURE command on
the force-feedback workqueue. Because the sysfs store returns success
immediately without waiting for the hardware transfer to complete, user
space cannot know whether the setting succeeded and a subsequent read of
the range attribute may return stale data before the workqueue drains.

Execute the aperture setting command synchronously within the range
sysfs store method. Open and close the underlying transport around the
command, clamp the input range between 180 and 900 degrees, update the
cached range on success, and return errors directly to user space. Read
and write the cached range with READ_ONCE and WRITE_ONCE to prevent
torn reads.

Because the sysfs store now sends the command directly using the HID++
device handle, the backpointer to the force-feedback private data is no
longer needed in struct g920_data. Drop the unused pointer and simplify
the attribute visibility check.

Tested-by: Gideon Heinz <gideonheinz02@gmail.com>
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hid/hid-logitech-hidpp.c | 36 ++++++++++++++++++++++++------------
 1 file changed, 24 insertions(+), 12 deletions(-)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index 1376d5bc3fbb..c65a32572292 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -2353,7 +2353,6 @@ struct hidpp_ff_private_data {
 };
 
 struct g920_data {
-	struct hidpp_ff_private_data *ff;
 	u8 feature_index;
 	u8 slot_autocenter;
 	u8 num_effects;
@@ -2478,9 +2477,6 @@ static void hidpp_ff_work_handler(struct work_struct *w)
 	case HIDPP_FF_SET_GLOBAL_GAINS:
 		g920->gain = (wd->params[0] << 8) + wd->params[1];
 		break;
-	case HIDPP_FF_SET_APERTURE:
-		g920->range = (wd->params[0] << 8) + wd->params[1];
-		break;
 	default:
 		/* no action needed */
 		break;
@@ -2729,7 +2725,7 @@ static ssize_t hidpp_ff_range_show(struct device *dev, struct device_attribute *
 	struct hidpp_device *hidpp = hid_get_drvdata(hid);
 	struct g920_data *g920 = hidpp->private_data;
 
-	return sysfs_emit(buf, "%u\n", g920->range);
+	return sysfs_emit(buf, "%u\n", READ_ONCE(g920->range));
 }
 
 static ssize_t hidpp_ff_range_store(struct device *dev, struct device_attribute *attr, const char *buf, size_t count)
@@ -2737,15 +2733,34 @@ static ssize_t hidpp_ff_range_store(struct device *dev, struct device_attribute
 	struct hid_device *hid = to_hid_device(dev);
 	struct hidpp_device *hidpp = hid_get_drvdata(hid);
 	struct g920_data *g920 = hidpp->private_data;
+	struct hidpp_report response;
 	u8 params[2];
-	int range = simple_strtoul(buf, NULL, 10);
+	u16 range;
+	int error;
 
-	range = clamp(range, 180, 900);
+	error = kstrtou16(buf, 10, &range);
+	if (error)
+		return error;
+
+	range = clamp_val(range, 180, 900);
 
 	params[0] = range >> 8;
 	params[1] = range & 0x00FF;
 
-	hidpp_ff_queue_work(g920->ff, -1, HIDPP_FF_SET_APERTURE, params, ARRAY_SIZE(params));
+	error = hid_hw_open(hid);
+	if (error)
+		return error;
+
+	error = hidpp_send_fap_command_sync(hidpp, g920->feature_index,
+					    HIDPP_FF_SET_APERTURE,
+					    params, ARRAY_SIZE(params),
+					    &response);
+	hid_hw_close(hid);
+
+	if (error)
+		return error;
+
+	WRITE_ONCE(g920->range, range);
 
 	return count;
 }
@@ -2769,7 +2784,7 @@ static umode_t g920_range_attr_is_visible(struct kobject *kobj,
 		return 0;
 
 	g920 = hidpp->private_data;
-	if (!g920 || !g920->ff)
+	if (!g920)
 		return 0;
 
 	return attr->mode;
@@ -2789,12 +2804,10 @@ static void hidpp_ff_destroy(struct ff_device *ff)
 {
 	struct hidpp_ff_private_data *data = ff->private;
 	struct hidpp_device *hidpp = data->hidpp;
-	struct g920_data *g920 = hidpp->private_data;
 
 	hid_info(hidpp->hid_dev, "Unloading HID++ force feedback.\n");
 
 	destroy_workqueue(data->wq);
-	g920->ff = NULL;
 }
 
 static int g920_input_open(struct input_dev *dev)
@@ -2866,7 +2879,6 @@ static int hidpp_ff_init(struct hidpp_device *hidpp, struct input_dev *dev)
 	}
 
 	ff = dev->ff;
-	g920->ff = data;
 	ff->private = no_free_ptr(data);
 
 	ff->upload = hidpp_ff_upload_effect;

-- 
2.56.1.750.gf70dc682cf-goog

