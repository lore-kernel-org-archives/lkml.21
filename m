Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795495371;
	b=at43gMGZ+/OgzcI2b759qkKHkReR4Y8TSP8+kdzbYB5EkJLndoLE1SajPp3bEO8egz12
	 4PqSZyu74pP7SNfLjugg0Bfxn/BfC/KajL146PTAuLfTzcpX83Z/GGC2Ju28WoNQtzxNN
	 qMBLYEQF8PO2kNCyi4ZfQzXO+3jKqhuh4xrdZ0IduQtcKZRQw2JIWADROyQmXoKtdA84N
	 DkpHxkiVPqj7sEk2cEQ7Yq7o94USx2wGINRUbNHJUJxwh1yEy3V0GYcXiVRPg/nhjJBNB
	 DjFApJVzZY2XkVzHQDA9O2RC+Q4wXU0I7iawoJ30xwOfnST8LAFK/DyVyjhP+b25sEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795495371;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=TTOETvouPXzmFdByLuoUtaMkBQLS1wjKXyxj4FAfEQw=;
	b=rolHKsiCJwgHySP2d3sEKq0m6oBhNQ62oN1WUpntln8kz8drBsWdvoWcs93P1wp9M3mf
	 6++yiUG6FxhCs6esSPy0wk3CPbfsMVTWLC2hSdvnNiXVX3fFxTregFm19IOihlUT6wsT8
	 f4tPPu3JoDogM2QqIlmn4FF/VfgOKZGNp0YvM5lrEafs+ACeFw1O1iAHY70ZlG3a3OpUf
	 BACzlRdbwpRIvbLIf0eS0dkTYgLOhgzOM/0DL7Bk4w7Mpu5BOUkpcodwLTXBfg/T7cXk7
	 zdVojzShN16mWrpw1OOdRWecsbQBlOrNwXLXJR5jUqhyJ9jPYdkA1ufsgKuJD1HTA2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YbHPTQLE;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7190C606A6A6
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 04:42:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7190C606A6A6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YbHPTQLE
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-385d8a00598so5786808eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 20:42:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795495370; x=1796100170; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TTOETvouPXzmFdByLuoUtaMkBQLS1wjKXyxj4FAfEQw=;
        b=YbHPTQLEUcHyz6rThsktz/NHerN8yx76WldC5cJjUte5gnydyM6dkwDb5Pm33cjDSj
         6Opk9mR/dsJ/4VYjs7pEJmINR2wkRXlofpJfh998lrgrAlxsrj4Q1TWuJGEgWy0hb0y9
         6VPmRoYdRM4+6K9zv/ypsnMvhpWyiQP4QLLjxa97FMjSlgn3mGu0GmqgglvlMuRwgFU6
         grUSbLzwclxmT82NqWWuJ+x9cTyw8oahlyhVaIf0/ymjYDb42xRaXPDcCGw0+mgklvGI
         aM+8FY48U3whzjhBlsnPOvnEeUD09TLIdCLB6OsVD7tOl8FxNnburJaHo5pBRphQH5r4
         jGhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795495370; x=1796100170;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TTOETvouPXzmFdByLuoUtaMkBQLS1wjKXyxj4FAfEQw=;
        b=XF0rPacz1JsPRuS9Rmispwco+0urqYJNswGIXayggKo9D8vDHQ2lseGtBdergOvAIU
         U0bRdUcSpWEcJtkfF6U4q/JlNPBIYHi8eSA/JU/ePLtNZC85X2tMxXlYwi6S+tkEmJsQ
         w6otC7MozBujLmqGVgPI2kJkZWhtwUGH6NWmG2TdVK6+ZIIe7TAqc/KaWLiESWdJo72A
         C1XA0xBt7Ahgef6c7qD/LMPWQmXUvJq3eWcZrEh9lvWsSSWxc/TrObXKhU+xcmiR3gjG
         fG0M+Rrzeg9Upus0iOkfp2FKXk+Wm6d35AyzcMB7gTqs8fk0Ul781UaeILU+fCtbqBqb
         cqPQ==
X-Forwarded-Encrypted: i=1; AL+hErHjdcSlfqYXZkqwEO1pSzeVsKsNDI536cgJpQvuOYNHdM829idNKV8SrB+VeFN+1XUMlD5AT8giV2E6vmA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/enAu8LpZN1pN7+f4lsE6dZZPV8/cj8iPkU7Kb722CKCaEuwF8
	Vhj/CmDow3wXHCL4x1+figkb9odSCfRMqncvsyF+YthJmJEjf49R3ewCH0GoGTsM
X-Gm-Gg: AZFdTZfyxADPawMCklp8cehJWdDH0T4X5IGSElMbpKytvSdX6188BmdTUz7kDq6OFig
	Nyto+YVggcg2Yr/5iWeCvceZ3+hUTF0KmvXYwsi0YJ8tv48uJRMzkDkN+4cxY5sUPOPttNXoD5W
	7hW6rriN2nPNI6McdAqOy4uyycNgHUnP6cv4FQI1249ZOrZP4cG5aL2rsmeebJt/5Ce101vpw9u
	t+FduyAldgYdYrBzaM2ghD21/goh/AMzYdvpoUAtNHBH9eKhow+jGQgtSsU5prm5IuDNdGGkEyd
	9+qi33QnFJ8M/3ecLrB5MxQ9O9igdygcwSw7EGv0Bh4r3/y8QByO+87iP7hOjD5kx5lobPbzOuo
	6d4WTxVOzyU7n7bJq82kF5cZuoorbiWQ6NFcg3s211s04kjGD7Oi5Vmsx32zliJebxxyKMIp3J7
	BtT0U2uVU+xz2k5ZM9n5+0LGg9kxk/MaUkJDq3Tyn+pn9rNqbBzwYs2AUSVZ7V93N4ofZfZA0zB
	9xwysOdwCGs6ADCofktUZ8lMDAIM3GDjTgmgQPOT9jZf+HIGRZ3Y0ELR5E6bcJOEaFDxclYZ3mg
	Q05upQ/Dj0MraIEJvfACLSGkMwiXL/vsTQsHA3k+9K+VQeLlIxWYPmozwVSa2t+qiY4buu7RmyS
	En4VfttQvO4awbuS3O5x4Dqgst/QoYgWLFkDkA0+X4wscelti4KtpntlGnFeyb4WtvSIjdJSUEz
	2hm6sSg1a9aQmA+Vm1Nw==
X-Received: by 2002:a05:7300:8282:b0:385:af7b:d788 with SMTP id 5a478bee46e88-385af7bda3emr12378687eec.2.1795495369576;
        Mon, 23 Nov 2026 20:42:49 -0800 (PST)
Received: from Mac.localdomain (198-27-228-154.fiber.dynamic.sonic.net. [198.27.228.154])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567abb870sm34172821eec.25.2026.11.23.20.42.48
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Nov 2026 20:42:49 -0800 (PST)
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
Subject: [PATCH net v5 6/8] ptp: ocp: report zero frequency for disabled SMA inputs
Date: Mon, 23 Nov 2026 20:42:47 -0800
Message-ID: <20261123-timecard-common-v5-d669cfa034-6-ahmadexp@gmail.com>
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

Disabling an SMA input clears its mux field. Zero is also the selector
for 10 MHz on FB and ADVA, so a DPLL read reports 10 MHz while sysfs
reports None. The DPLL core then skips a 10 MHz request as unchanged,
leaving the input disabled.

Substitute SMA_DISABLE for disabled inputs before the frequency lookup,
as the sysfs path already does, so the None entry reports zero Hz.
The preceding initialization fix also recovers this state on rebind.

For ADVA X1, the earlier combined-input fix already returns zero Hz for
a zero input selector and permits later frequency changes. This patch
does not fix another X1 -EINVAL failure; it uses the explicit None entry
without changing that result. X1's lost state across rebind is addressed
separately by the initialization fix.

Source-derived tests with stubbed MMIO and the DPLL core get-before-set
function reproduce the FB/ADVA disabled-input error and pass under
ASan/UBSan. No physical card was tested.

The issue and inaccurate incremental description were reported by
Sashiko review. Codex assisted with the correction, tests and changelog.

Fixes: 09eeb3aecc6c ("ptp_ocp: implement DPLL ops")
Link: https://lore.kernel.org/r/179502617840.3136.12704245716223038161@kernel.org
Link: https://lore.kernel.org/r/179548551472.3135.11972018356692852897@kernel.org
Signed-off-by: Ahmad Byagowi <ahmadexp@gmail.com>
---
Changes in v5:
 - Split the DPLL substitution from v4 patch 3's initialization fix.
 - Retain the DPLL introduction Fixes tag for this part only.
 - Correct the incremental X1 description: patch 4 already handles its
   zero selector; the additional zero-as-10-MHz correction is for FB/ADVA.

Testing: disabled-input get/compare/set and re-enable, including the X1
series boundary. Stubbed MMIO only, no physical card test.

 drivers/ptp/ptp_ocp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/ptp/ptp_ocp.c b/drivers/ptp/ptp_ocp.c
index c4c9d3501edf..e27abe2c24c7 100644
--- a/drivers/ptp/ptp_ocp.c
+++ b/drivers/ptp/ptp_ocp.c
@@ -5897,6 +5897,8 @@ static int ptp_ocp_dpll_frequency_get(const struct dpll_pin *pin,
 
 	val = bp->sma_op->get(bp, sma_nr + 1);
 	val &= SMA_SELECT_MASK;
+	if (sma->mode == SMA_MODE_IN && sma->disabled)
+		val = SMA_DISABLE;
 	tbl = bp->sma_op->tbl[sma->mode];
 	for (i = 0; tbl[i].name; i++)
 		if (val == tbl[i].value) {
