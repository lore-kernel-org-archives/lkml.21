Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794998744;
	b=c+LBvSrSG6n1jSq4zRpK8W77meZQNcvPqbwLp8dFxzUE50qPVGK6f2rWQFFzNAD8Hxmb
	 VLoen6hv5SMIME0Nqns5N600ZGNo7YRXRSpqW60hrdNNbiXPXx+pQSTxFYeTFkNYIZbvd
	 hU7ayamtzSYzyIdPj5s0iDdaUGLOnXTO4ubZkQBfmNFZUkQvs+3cY9EjcMLUsYKXY9vZB
	 p0eaQUfrrPgUmZqwUAgxih+hm5EdUzhXTGlL0uRCojOe4vRIK6FHhJ16I/0LTNLx2ll2U
	 fcm/gcGqCooo64KOM4NdyrPAfn76ABKOtlrBqkpo8t8H7jz/0Xz7MUrLMOsxoZxLJJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794998744;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=AiXntOOWWCJfb4TGuJ6oSSVg/cGdXJUJaojShUwh9+Q=;
	b=0mAZcCdDt5bvaYyDl7XoCC5NqIknndK0I30pQNZ0Otbc7JGlTi+wEotVriJ5MkhNC7R2
	 903Zli+H8IUcSM7RFv8tYYEhvQH7Cn3f1m4KAEr32h2WB+O1+qtNwS3NCrIXrWQd/U7lL
	 TkZTYt2UchrmpZPOAZPuSDiIQhTPi2rBfWgXyOXfdB+Avr4SA0lWO7pZJgHC0zxC9qrO1
	 3j/HSjKSlv0OsgWid8hs5ZCZXFZjWtRM8VWrrMIV8eseT7dqghZ9+LRWWzTX/N3LgArwB
	 6xgkid7FjnO2DPlpNh1NCs6tFa01++HOC4bjmXihXml1EZm/lBzqMDftq6d5Mrh5RSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JhHoGZx3;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82A62606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 10:45:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82A62606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JhHoGZx3
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-36a315ed211so664749eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 02:45:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794998743; x=1795603543; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AiXntOOWWCJfb4TGuJ6oSSVg/cGdXJUJaojShUwh9+Q=;
        b=JhHoGZx37+/5tKT3WzBQUpRpgtGpD23sl0PwUs2dAjeTw0boTHa7nxbxGiiO3oG8Se
         I9x+BeyiZ4/igwRhoe1gHfstgfayg0y3IJ3ObCFWJLCK18igY6YJUkQH/dK9eB22yQZi
         miXjQn3tPfylhk07UnLAYdcMvzGSGZmXC+TBV+NWElmWGVL+mQaEiEm/c6bjD2bVSU80
         nPZbJAPgK8hksQbkKQHjivbqTcBTXY5DcBmuU5wopD/FHfH2aBI/85i5madrJ3PFpDfS
         DrhenMUwGOUX4BJBTu9ARuTmLO4JDH+0QraTz3Ftx6aWE5cppkUQx8u7gytN56ZEw7zh
         RKGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794998743; x=1795603543;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AiXntOOWWCJfb4TGuJ6oSSVg/cGdXJUJaojShUwh9+Q=;
        b=AinZy0JM9klZxhnkslW2aM754nRvRykFjk1k3DBxWYQPlu5yIqdP10q74209DoBvup
         e/SW0FE1+PGEUnolSfoDFqtpaok9FHIagnvv8jm5XjgB1/oRNTJskEUgPmIndvYruYUI
         Qikqt5sVADx8547xnpq0itVI1JZP1mcNrn0eC9k1uAS50Mn4NSUYfTapl2XMKnsEwzvT
         zzBLbZlTCfgmz4OBnnaEwORdIYCy2KR8LLrtphROj/N7jVJgqblzWu4c5eMeCtM4OkU4
         BS5pSTQysDgKqYZ9rz6myNLbnygSpexWBr/Af7ys/fLckLaJXTp/Dz75CueNnUm6Bgra
         BfJA==
X-Forwarded-Encrypted: i=1; AL+hErGpIFoKjQeQwdtdKgkNyp6arUhSfezilSgexeky+MtkQAx5XWlHRtDETdwGIQvzkECLYbNATZXBqgvxlmM=@vger.kernel.org
X-Gm-Message-State: APuU4Z85TxZFHYrjlkNeOWi5hitnk6KZ/9DHTEd8BSH0JbhwsnrIpVj2
	JdYToorQHuvjtvPqacbR3W4gSoORyDS7YR16ZNNXUy6ghHujgGxUYWHBjEw2j9sXKE0=
X-Gm-Gg: AZFdTZc61dSnn23B/rE6WWPwnVxbDpbWHTV9Gg9gkr7nHy0IqULhZD0chCXPxQkfrXm
	nbVup4xoi2nddCSEjHTcu0A5mAbvoD+nopsoSQ993WAwWB5LUoBXvxS3UMAAPrCBKkzhAtWXfhC
	BZ+kC9RiUdCXoPcGBg1XmxHwxvC/8Tk5lgWjWIH/uS9hxdi/tF0mIVOfzH6JoZMoxZlEtSlBQY6
	WKQSCxWn73rMGRqoJLsDXZmOIgWzkFMdSp8YN+OZrlRFhb7o9C56WK+8ehP10nQTp8KTqGDcnT0
	Izc2iuyJcizB0yXN+si2Vh0AWtNVQu0c6Jtp4KXq5PLuy0cbl2rtTRwMx5xFWGx+aDzUPV2+MFR
	5BdaRF4pV/2gh4bD88cQEi3ARIvhzKIc1nAtbvplIkTL5Ri/+Yn7wecSseEaSexT/ZINbXM4grc
	ECnI4jXfoA5q6cWITO02ljbcnVWR7zJq2tfaq3dYVeLu6xeNC7InOQRiPjuSp5JH7/iGBUgIQL6
	k+/I9mu/j5hTjVHoqg6PhJlaUuy68SU8HUVxQ5fnd138aPCmPTSRcm/LAtt2U5ehjkLk2a0sToJ
	JpH2EkwGVex6hZzFVO0MIe2jYk82jQ5f1SrRqhz5MVeuTdtmx5T+1WXe/6vq4hoS7ngAxytkFwV
	0XR59iJvAGdrBxPGVqMZHXYhu/C4nCYRI4TZ9klRNggUCDn199wl95vBiKbdBFQ20b9IJtHPe0h
	QJQvGfG9T4E8PPTB6WO9+XzwIRpsK4EvJ0jEkuPG1GuPGVYzW/bTBhJrNUizCCNGI=
X-Received: by 2002:a05:7300:e9c8:10b0:37a:15c:b8c5 with SMTP id 5a478bee46e88-3810bf52de9mr5393573eec.2.1794998743427;
        Wed, 18 Nov 2026 02:45:43 -0800 (PST)
Received: from kapoor.iiserb.ac.in ([203.18.51.239])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a6304efbsm11906478eec.7.2026.11.18.02.45.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 02:45:42 -0800 (PST)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Mudit Sharma <muditsharma.info@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnav Kapoor <kapoorarnav43@gmail.com>
Subject: [PATCH v3] iio: light: bh1745: fix 16-bit register accesses
Date: Wed, 18 Nov 2026 16:15:32 +0530
Message-ID: <20261118104534.159876-1-kapoorarnav43@gmail.com>
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

The 16-bit colour data and threshold registers are little-endian
LSB/MSB pairs, but the driver accesses them through regmap_bulk_read()
and regmap_bulk_write() with an int or u16 buffer and no byte-order
conversion:

- bh1745_read_raw() reads 2 bytes into an uninitialised int, so the
  upper 16 bits returned to user space are stack contents.
- bh1745_read_thresh() reads 2 bytes straight into *val, which the IIO
  core leaves uninitialised, with the same result for the event
  threshold attributes.
- bh1745_write_thresh() writes the first 2 bytes of an int, which are
  the upper (zero) bytes on big-endian.
- bh1745_trigger_handler() pushes the raw register bytes, which are
  little-endian, in a u16 to a buffer whose scan type is IIO_CPU, so
  user space gets the samples byte-swapped on big-endian.

Use an __le16 buffer for all of them and convert with le16_to_cpu() /
cpu_to_le16().

Fixes: eab35358aae7 ("iio: light: ROHM BH1745 colour sensor")
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Reviewed-by: Matti Vaittinen <mazziesaccount@gmail.com>
Signed-off-by: Arnav Kapoor <kapoorarnav43@gmail.com>
---
Changes in v3:
- Include linux/types.h for __le16 (Andy)
- Add Matti's Reviewed-by
- Rebase on the current fixes-togreg

v2: https://lore.kernel.org/all/20261117110327.198084-1-kapoorarnav43@gmail.com/
v1: https://lore.kernel.org/all/20261116194214.45174-1-kapoorarnav43@gmail.com/

Compile-tested only (W=1, checkpatch --strict clean); I don't have
BH1745 hardware.

 drivers/iio/light/bh1745.c | 32 ++++++++++++++++++++++----------
 1 file changed, 22 insertions(+), 10 deletions(-)

diff --git a/drivers/iio/light/bh1745.c b/drivers/iio/light/bh1745.c
index 2b8ff36071b8..d312ea278f2b 100644
--- a/drivers/iio/light/bh1745.c
+++ b/drivers/iio/light/bh1745.c
@@ -16,6 +16,9 @@
 #include <linux/regmap.h>
 #include <linux/bits.h>
 #include <linux/bitfield.h>
+#include <linux/types.h>
+
+#include <asm/byteorder.h>
 
 #include <linux/iio/iio.h>
 #include <linux/iio/sysfs.h>
@@ -421,19 +424,20 @@ static int bh1745_read_raw(struct iio_dev *indio_dev,
 			   int *val, int *val2, long mask)
 {
 	struct bh1745_data *data = iio_priv(indio_dev);
+	__le16 value;
 	int ret;
-	int value;
 
 	switch (mask) {
 	case IIO_CHAN_INFO_RAW:
 		if (!iio_device_claim_direct(indio_dev))
 			return -EBUSY;
 
-		ret = regmap_bulk_read(data->regmap, chan->address, &value, 2);
+		ret = regmap_bulk_read(data->regmap, chan->address, &value,
+				       sizeof(value));
 		iio_device_release_direct(indio_dev);
 		if (ret)
 			return ret;
-		*val = value;
+		*val = le16_to_cpu(value);
 
 		return IIO_VAL_INT;
 
@@ -503,6 +507,7 @@ static int bh1745_read_thresh(struct iio_dev *indio_dev,
 			      enum iio_event_info info, int *val, int *val2)
 {
 	struct bh1745_data *data = iio_priv(indio_dev);
+	__le16 value;
 	int ret;
 
 	switch (info) {
@@ -510,18 +515,22 @@ static int bh1745_read_thresh(struct iio_dev *indio_dev,
 		switch (dir) {
 		case IIO_EV_DIR_RISING:
 			ret = regmap_bulk_read(data->regmap, BH1745_TH_LSB,
-					       val, 2);
+					       &value, sizeof(value));
 			if (ret)
 				return ret;
 
+			*val = le16_to_cpu(value);
+
 			return IIO_VAL_INT;
 
 		case IIO_EV_DIR_FALLING:
 			ret = regmap_bulk_read(data->regmap, BH1745_TL_LSB,
-					       val, 2);
+					       &value, sizeof(value));
 			if (ret)
 				return ret;
 
+			*val = le16_to_cpu(value);
+
 			return IIO_VAL_INT;
 
 		default:
@@ -547,6 +556,7 @@ static int bh1745_write_thresh(struct iio_dev *indio_dev,
 			       enum iio_event_info info, int val, int val2)
 {
 	struct bh1745_data *data = iio_priv(indio_dev);
+	__le16 value;
 	int ret;
 
 	switch (info) {
@@ -554,10 +564,12 @@ static int bh1745_write_thresh(struct iio_dev *indio_dev,
 		if (val < 0x0 || val > 0xFFFF)
 			return -EINVAL;
 
+		value = cpu_to_le16(val);
+
 		switch (dir) {
 		case IIO_EV_DIR_RISING:
 			ret = regmap_bulk_write(data->regmap, BH1745_TH_LSB,
-						&val, 2);
+						&value, sizeof(value));
 			if (ret)
 				return ret;
 
@@ -565,7 +577,7 @@ static int bh1745_write_thresh(struct iio_dev *indio_dev,
 
 		case IIO_EV_DIR_FALLING:
 			ret = regmap_bulk_write(data->regmap, BH1745_TL_LSB,
-						&val, 2);
+						&value, sizeof(value));
 			if (ret)
 				return ret;
 
@@ -741,18 +753,18 @@ static irqreturn_t bh1745_trigger_handler(int interrupt, void *p)
 		u16 chans[4];
 		aligned_s64 timestamp;
 	} scan = { };
-	u16 value;
+	__le16 value;
 	int ret;
 	int i;
 	int j = 0;
 
 	iio_for_each_active_channel(indio_dev, i) {
 		ret = regmap_bulk_read(data->regmap, BH1745_RED_LSB + 2 * i,
-				       &value, 2);
+				       &value, sizeof(value));
 		if (ret)
 			goto err;
 
-		scan.chans[j++] = value;
+		scan.chans[j++] = le16_to_cpu(value);
 	}
 
 	iio_push_to_buffers_with_ts(indio_dev, &scan, sizeof(scan),

base-commit: 51b83d4cb0f5c1342868c7aa1edbf0c4867477aa
-- 
2.53.0

