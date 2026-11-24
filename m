Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795495359;
	b=CVpMSjTt49jGLuLTVd7aV0y7a6Q6u69PGZhep3Gh/atFpb+tKuXJhXScohVr6let8pud
	 OfrqP5TRG8Ik9nHAZVbKQ6rlMdHA6DQE3vPX7A8lB9fyr6vmYwqdhYilzeZmS1tsaMdJk
	 A0M6qoT3bLdxQn3acWa1WleV6Rqd+oNnKNkOXuHCYk+usq22tV6PPHMXOXCxu7szJWUML
	 7gSjyV2Ui7NdncB2VT9v5FxDT/apxAQSUbl7Gw9q2XcLzR7paFzi9uDCqCC5b+wHxoNpu
	 ki0F/7VVDueerDuzuFleI9XOkdgjs3iZLkk6qAYkJCDtfSCzDvOrKDtzrfZc1gs3hBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795495359;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=3LR2pXBU1UF0saUliIwhq7NUmfXvWt7NIINFzWDFrag=;
	b=R1bK+hNFzJv9LLqlOOfHnXH7cIs0kE7MaCQixNC7CbMDp/6JnBXdTdSe4lvelIxDN0JP
	 jkGzBQIS+MM5dx64QHdwFuPShzOEAG0HM5H7n4RWpxJVKnWrhKyroxe7mim33UnVM9AOF
	 8Ifc58vHqZKPrcAhDmofHtde94NyBp37G/+zeSCcjWWIfBoZ44nYDESOFibCtf0e+798P
	 4jvfK8MbND0ybnakYD06NAaIE0Ln60/4NpZDNkJGeCbtqU6u1J6ZQo6dVgACln8Ei12K6
	 2VuXy24WrUvSB7jLt5B5cx+Q8dFB1aPiWi9hJ9hwuUH9QMyCulFZEq7VVgcU/qcTRlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xUNWD6GP;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 397EB606A68C
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 04:42:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 397EB606A68C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xUNWD6GP
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1a3c08d6928so5781447c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 20:42:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795495358; x=1796100158; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3LR2pXBU1UF0saUliIwhq7NUmfXvWt7NIINFzWDFrag=;
        b=xUNWD6GPmcjKjtaVeqbbPUL4rhsI3ZPkzj8vw1Bv8K4oR2xcifghha1g3L4ksckrHN
         jXjtI4p4vTfly0APrpY8hpdaWNC2Jb6o6U5PbhfjcrWKaSr8G6Uhd/p9xUf2K/O3L1A6
         ST44sLOxbr2tglyn9HHlZZ5RcbNkVZUlVzN6RyHDaHmjAD62fB4v6pD6TOry51LoAtVw
         SIx6npuwVkWoV+l20JlgeEgfVn0tMx3zvudZbFOlIzAW0QwkwPBkOiWMc36kQpTiBc/P
         9efZDBdLH9iKSqA2rChiENNCaZk4P5VKDJ1Zgh96F4JhKy55ITo9zfG+RdL7m0kv0+GZ
         y8kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795495358; x=1796100158;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3LR2pXBU1UF0saUliIwhq7NUmfXvWt7NIINFzWDFrag=;
        b=bJQDgMwMVzK+ZOgceGxUY6zCFKsvls3RAGNHRVqXn8WbnfK8ZbBxW6F19Ss9nT+glf
         DtWd8dKTIZQhT2gGTTza2Aq9JzxVSMZXVf9YticpGdQ8t9KZxoHNkneetkaT5C0JsuPs
         TwoRGnTdRIGP9ZAMJziElxNDVz6mbB5o662mks+S0YnUsHwY/0u0V8stbkllZjGKlpAD
         Cc0aeTEDM6o8xBPz7Vqtd2fu0Tbes2mvh36UPO2McRWiRxhc4+VnDZMMjNyU0StFQ8g0
         BREl9MC3hairLH0IsmlD/Gc4oqMaoh7mfcp0gvNeAfodcdaIFFuG9EU07dAhiK1v5L/f
         bp4A==
X-Forwarded-Encrypted: i=1; AL+hErHVaHrpB8QlQWjiE1+GnJ/zUrkTTGO/DGKuQhuy2G/SMVCCS5195ZOVQuFpRyzonsfRioVH48datJJH6FI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+7bu+736xtu4yf5VSlsr5QhKmw0E2snpsUyzSUYW48cttMffgJ
	73raSnfNVk9gOoSE6s4EdM1YiI7Hca00BUC2ZLGeY9/XhgC14w7zB4xY
X-Gm-Gg: AZFdTZfjAJZ88+XAXslKnRcfiMB582MvNkzabe9wZixERs1yrPx36yO2/JgqS+W8gfu
	8E6E2lc1i6lsGYK8ySLN/rTDX1RK53lWbhbgJ4JGZlhnDRqMkq4M9Z4W3utXDuABq2+mVEg/M4Q
	vMpPJ2+Nr8Ba8N7N/fnIB2JMIVVDv47Zd+5TedlGXLTH69jzLiWJojiB49bGjL4SnvkoXX8yeob
	97a6Qo4q/UajW41WOjw3qttPG0RN9DhCcu7OH3P+jh3O6mN7wigdDunkx5HunvFlbNlSS5qS6UN
	3zpTAb84P4yGzWOrPruIVuv2v93jD3EzMQVS+ad10usZIMhvdB0+2NPtZN8INMMVO4g3S/t3ZUr
	oOHdTV21MPIEs74myLXL6JNuZ6ONQvYv3AQ4+jtEzbtPuL1G/SzKluw+IAdlL2lFVa16SvNXflg
	eEr6nkRmJkzyn0lUQGIWAnoQSelaNGjyh2igrubsRyyekJZcYZcLbUg38AAAWIv1jWLljHefoJ6
	4k4u6pYmAiTM7p9rAQ4EyTivATBC/UzohIK0Emx3WI1MnXAwKyg1BZ9Uq5nQ2Zr5m7dMx0sf9xs
	g3OOSvEi4N0joksEUqRVO+WgS7q/apNPXd9stL6PK0qVn9RB9K9sBE6eogt0bt+eOBOMWRjxDVi
	daRAWvpXZYdZJcrQVvY5j8AdTYIi5W3nqt4jucU+jPkTCBvTRSBZ+ujQQ9pGXzQP1BoK6yobC
X-Received: by 2002:a05:7300:c00f:10b0:386:c3ad:dc25 with SMTP id 5a478bee46e88-386c3adde30mr548401eec.34.1795495358333;
        Mon, 23 Nov 2026 20:42:38 -0800 (PST)
Received: from Mac.localdomain (198-27-228-154.fiber.dynamic.sonic.net. [198.27.228.154])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7f59sm43092880eec.6.2026.11.23.20.42.37
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Nov 2026 20:42:37 -0800 (PST)
From: Ahmad Byagowi <ahmadexp@gmail.com>
To: netdev@vger.kernel.org
Cc: andrew@lunn.ch,
	arkadiusz.kubalewski@intel.com,
	arnd@arndb.de,
	davem@davemloft.net,
	edumazet@kernel.org,
	jiri@resnulli.us,
	john.stultz@linaro.org,
	jonathan.lemon@gmail.com,
	kuba@kernel.org,
	linux-kernel@vger.kernel.org,
	olteanv@gmail.com,
	pabeni@redhat.com,
	richardcochran@gmail.com,
	rmk+kernel@armlinux.org.uk,
	vadim.fedorenko@linux.dev
Subject: [PATCH net v5 1/8] ptp: serialize sysfs requests with the ioctl paths
Date: Mon, 23 Nov 2026 20:42:36 -0800
Message-ID: <20261123-timecard-common-v5-d669cfa034-1-ahmadexp@gmail.com>
In-Reply-To: <20261123-timecard-common-v5-d669cfa034-0-ahmadexp@gmail.com>
References: <20261123-timecard-common-v5-d669cfa034-0-ahmadexp@gmail.com>
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

The extts_enable, pps_enable and period sysfs stores call the driver's
enable callback without taking pincfg_mux. The corresponding ioctls and
pin configuration changes take that mutex, so sysfs requests can race
with them and with requests through the other sysfs attributes.

On ptp_ocp, PPS and EXTTS channel 5 share pps_req_map and a hardware
source. Concurrent read-modify-write updates can lose a subscription,
and an enable can overlap the register writes and IRQ drain of a
disable. The software subscription state can then disagree with the
hardware state even though both requests succeeded.

Take pincfg_mux around all three sysfs enable callbacks, just as the
ioctl paths do. Keep permission checks and request validation outside
the critical section, propagate callback errors, and return -ERESTARTSYS
if acquiring the mutex is interrupted. A mutex permits callbacks that
sleep, including ptp_ocp's synchronize_irq() on disable.

The Sashiko review identified the EXTTS/sysfs race while reviewing the
timestamp teardown fix. Inspection found the same missing serialization
in pps_enable and period. Codex assisted with the correction, tests and
changelog. Source-derived tests with controlled scheduling reproduce the
reported shared-PPS failure on the previous series and pass with this
fix. Local KUnit tests call the real sysfs stores under mutex contention
in QEMU with KASAN and lockdep. No physical hardware was tested.

Fixes: d94ba80ebbea ("ptp: Added a brand new class driver for ptp clocks.")
Link: https://lore.kernel.org/r/179548551283.3135.17206659598806657887@kernel.org
Signed-off-by: Ahmad Byagowi <ahmadexp@gmail.com>
---
Changes in v5:
 - New prerequisite from the runtime-race review of v4 patch 1.
 - Serialize EXTTS, PPS and PEROUT sysfs stores, not only EXTTS.

Testing: 100 controlled runtime suites with four interleavings each;
real-store mutex-contention KUnit cases under QEMU KASAN/lockdep; permission,
error and interrupted-lock model cases. Removing each lock independently
causes a runtime assertion failure. No physical hardware was used.

 drivers/ptp/ptp_sysfs.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/ptp/ptp_sysfs.c b/drivers/ptp/ptp_sysfs.c
index 8e0e0aa09981..90fdddc1e6a7 100644
--- a/drivers/ptp/ptp_sysfs.c
+++ b/drivers/ptp/ptp_sysfs.c
@@ -60,7 +60,10 @@ static ssize_t extts_enable_store(struct device *dev,
 	if (req.extts.index >= ops->n_ext_ts)
 		goto out;
 
+	if (mutex_lock_interruptible(&ptp->pincfg_mux))
+		return -ERESTARTSYS;
 	err = ops->enable(ops, &req, enable ? 1 : 0);
+	mutex_unlock(&ptp->pincfg_mux);
 	if (err)
 		goto out;
 
@@ -130,7 +133,10 @@ static ssize_t period_store(struct device *dev,
 		goto out;
 
 	enable = req.perout.period.sec || req.perout.period.nsec;
+	if (mutex_lock_interruptible(&ptp->pincfg_mux))
+		return -ERESTARTSYS;
 	err = ops->enable(ops, &req, enable);
+	mutex_unlock(&ptp->pincfg_mux);
 	if (err)
 		goto out;
 
@@ -157,7 +163,10 @@ static ssize_t pps_enable_store(struct device *dev,
 	if (cnt != 1)
 		goto out;
 
+	if (mutex_lock_interruptible(&ptp->pincfg_mux))
+		return -ERESTARTSYS;
 	err = ops->enable(ops, &req, enable ? 1 : 0);
+	mutex_unlock(&ptp->pincfg_mux);
 	if (err)
 		goto out;
 
