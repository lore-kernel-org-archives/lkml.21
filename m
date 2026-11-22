Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795333631;
	b=xFF9GrrNIBPrqvK1/uy1AAHHVtO5+efkymY0o4cMijTknED7qWkxK4gYo8Dt2RSE8+3P
	 9L95UgGZUggC3ScIwwhwvXnufMfz0uMtiiAC6RdHSL6/HioiOZdIb93BaZwhfhqYcj6jR
	 DXphJZnvj/7wirhvYM1AlOQoGzsWCF33kKr2oCHhQhdDSh99POo1A7timajOSYaNipGG8
	 W2WEXzPLFAPCnIGImTHbYSLcWWC3W27z5JYpzqn/7zIZmO0dSC9nvU0Hq7hOoa3eAoOuW
	 knGo+Df90WAgI4X6i/u6p1NY8pEzaz0UFqsrDccUH/MomG+9QltgCEEzUVRiTID4LWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795333631;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=H1Qd9Fv/BWffK66RMxaaCwY0cb70dS2E1+H4i8vWI9o=;
	b=O6B7D/CooTMeW5yd6BnkgEmuzqPdw+1B5v9hsy2jWIqMiuSi+M1IeRLGU+oumJTsptUb
	 dyqJWFQNDefqKkKnCa2SN7DBf8Fxf2W32Vy16k3YciP9dFTIima2xTBOwMf9/SPjhXl8C
	 oBNrSsPJxXXJmCT3HEPnoCa/E2+AXlTRgJz0pLKrJJmB3Z4bk1ZuEUYYmM804/iViPl1z
	 612j2/U+B+AHZSS5m9GCAHtL904PckZOLGJ+zhvuH3hDwgETYtEG1pRmOkDTC1GE6+6dN
	 OSAIyr4pSsvDN7mcJqeqitN6sA6bkBAWytuvO9W9E9COGO7EyWd/a3QpGd5h7ORaiTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nnxGHbR8;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9074606A32A
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 07:47:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9074606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nnxGHbR8
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-3282db206d3so6850974eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 23:47:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795333630; x=1795938430; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H1Qd9Fv/BWffK66RMxaaCwY0cb70dS2E1+H4i8vWI9o=;
        b=nnxGHbR8/m0N0FCfBEOdn3JIClOJq/NAFkFIVvMjfprljv3AYfc3R84tiZPqMiIubb
         62f7g/9E40W2uvx+JwwVETxaAuC02I/dCEvFXc4qkhNpVKNRMpuZ073jBD7yf/ebIoLH
         4wmlrSTuR7nVt1GrMbRUfY0CLkWFDD+PzMRwFtpP6T3Uc8xLp7AKtaaYPXQJbIso/cVb
         DMAbCKhrA1RGqmhO20ZZBMfnNFsStxO9PvF3/UmOC4gT2wQ9FMkHfsCt43T8fCN/+OIv
         G8eUw0uVX2g6FD6OFRvybVOhibeTqY9GcXCnRZ3Xweq+I4FsfrImEQPDtpRdlJ4/K0f8
         fDyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795333630; x=1795938430;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=H1Qd9Fv/BWffK66RMxaaCwY0cb70dS2E1+H4i8vWI9o=;
        b=Mu2J/z08DBykAo0iOjMx2h7pW0krnKRFYVG1Mc17B88+2DEN4cZ8UM/sCw62Kb0ErD
         gU4neCZ32hGqG7j2jlG0r1QzRdRt/hzWjZMXJ5iJMBT7rAsxeoGqL4HTsv4uGRm7M5Xl
         WEvDwqMw7VMvvX4mU9XzU4CycObOI4jdeCodRN3UBEhE3R4fSzt1afSEG6E8GX4BsXrd
         2DXo4GmwvkCMYMGJgFrzEd16xMtMqfgZW343Vm2BdtU5rdIYaUvNT7fMs3A1PDytZcyl
         1ygJSpJEZ2XvAmfubNLMs7pSQCh/tGqtrjRblS7TMh786J2gYxiHah9bj05CDuFbdPnR
         349Q==
X-Forwarded-Encrypted: i=1; AL+hErEqPwfMnnmPxfbt12GURFFyAJ45wbvPxUBIeRBqrHp545Jpb3WmejqclpQbIO+Va0sDqhsvkZ2U9ZMjPsc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/l6XP8+UcGE+kO8uRqPajsk3txn5dyX9qQEYpGMh7O2n5Vpm/t
	qnFTghVLchoyOHaF830E+eQQ0y0qC5F0BxJqD+9xSlsn1GE3HoMh93ob
X-Gm-Gg: AZFdTZdcHY5OsN9H7WWzQRrYZhxSTo/vWm9BXSel6RcuNKHM82vvHr5sWEALs8JD4mc
	vBJpqVDe47iJlxRAgKO9fsmzZEqR64L55rldzKI4Y2jPIsYLUjvA4OrjWTOudVsl+A8V09RAq+d
	Tve3fhq8sWF5kth9fyFuoYC7gr6gBeYTxVwlybzzpJS3IHDvRfsq4dTEFgj4Ry45lKC+mv+6zOq
	3Il+gGyFqLulc0/cUn1FGedq0nQvGHjb422F2cFW4bvVmkICWypdBWldHpjl8GtAsDOLpmmRjMJ
	qRpgIdIv6SjzFWABpNiuzroKEzkNH+0ykwy9YUe6KIRJzR8mhNLLIzlagKbeR/5YUbQNah1L/uj
	8R7h8bG7zbIxdeDBsxgVdcj6kUXt9KDxWqG1RBGpK/R+ONwPRFeMl5r+5WqwTLtPmbxb2/3BFx2
	8RzFI9OyRXscDkm5lhYFIX3G0ccPlzqrGMWwSMmYY/elfGnSy/nOrb65mz8VSKAUkYaPfAv9joJ
	dxyo4IKtoUC//clSCzYcW0JcPmJnUxsCUQWmLjqwFmtZ/TzDDCswT7XmNXwjxf9p5bVMgSetMK+
	OCnN97HiycGx3eZ1yL7wizbY+HdMOhXldPDUPcu4K7MH7FBc+MbDzXGCKlEE5AVaqavt7qIHgXq
	1FPU01Yf0xjQzl+W2ts/vALZ/mLHP8etRlxjeTUJaTy30Y8jWCn4olewO9NMe/N/GhR3TML7lnd
	jU4Ci3MIg0Lpj81V27Y546lMGN178MU40YCU7t6xY2ww==
X-Received: by 2002:a05:693c:87d3:20b0:382:8358:9e03 with SMTP id 5a478bee46e88-3856ef457c4mr9427456eec.17.1795333629927;
        Sat, 21 Nov 2026 23:47:09 -0800 (PST)
Received: from kapoor.iiserb.ac.in ([203.18.51.239])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385667decc2sm24898071eec.9.2026.11.21.23.47.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 23:47:09 -0800 (PST)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Gwendal Grignou <gwendal@chromium.org>,
	Stephen Boyd <swboyd@chromium.org>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnav Kapoor <kapoorarnav43@gmail.com>
Subject: [PATCH v2 2/6] iio: proximity: sx9324: fix proximity threshold writes
Date: Sun, 22 Nov 2026 13:16:42 +0530
Message-ID: <20261122074649.239441-3-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122074649.239441-1-kapoorarnav43@gmail.com>
References: <20261122074649.239441-1-kapoorarnav43@gmail.com>
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

sx9324_read_thresh() reports a PROX_THRESH register value r as r for
r <= 1 and as r * r / 2 otherwise, and the division rounds down for
odd r. sx9324_write_thresh() inverts that with int_sqrt(2 * val), which
is one register value too low when 2 * val == r * r - 1, so writing
back the threshold read from an odd register value lowers it by one:
setting the threshold to the value it already has changes it, for 127
of the 256 register values (3, 5, 7, ...).

Use int_sqrt(2 * val + 1), which gives the largest register value whose
threshold does not exceed val: for r > 1, in integer arithmetic,
r * r / 2 <= val is the same as r * r <= 2 * val + 1. The result only
differs from int_sqrt(2 * val) on those edges. Checked for every val
from 0 to 65535.

Also reject negative values. They are converted to unsigned int, and
2 * val wraps at 32 bits on both 32-bit and 64-bit architectures, so
e.g. INT_MIN is written as 0 and values just above INT_MIN as small
thresholds instead of being rejected.

Fixes: 4c18a890dff8 ("iio:proximity:sx9324: Add SX9324 support")
Signed-off-by: Arnav Kapoor <kapoorarnav43@gmail.com>
---
 drivers/iio/proximity/sx9324.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/iio/proximity/sx9324.c b/drivers/iio/proximity/sx9324.c
index 93f9577bbda7..57fe78089167 100644
--- a/drivers/iio/proximity/sx9324.c
+++ b/drivers/iio/proximity/sx9324.c
@@ -613,12 +613,17 @@ static int sx9324_read_event_val(struct iio_dev *indio_dev,
 static int sx9324_write_thresh(struct sx_common_data *data,
 			       const struct iio_chan_spec *chan, int _val)
 {
-	unsigned int reg, val = _val;
+	unsigned int reg, val;
+
+	if (_val < 0)
+		return -EINVAL;
 
 	reg = SX9324_REG_PROX_CTRL6 + chan->channel / 2;
+	val = _val;
 
-	if (val >= 1)
-		val = int_sqrt(2 * val);
+	/* Inverse of read_thresh(), so that writing back a read value is a no-op */
+	if (val > 1)
+		val = int_sqrt(2 * val + 1);
 
 	if (val > 0xff)
 		return -EINVAL;
-- 
2.53.0

