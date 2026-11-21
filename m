Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.224
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795302465;
	b=ff8ua9FNHkV+F6CYIghmsSDX1oQBFvh5qUpEGIrYT8djpv5NFJ3kbbriAiERqhheS/l3
	 2iJ/KuWQuaoOILBBNwL44PRumm88/GDV7llnVoNvIjczi4WCRO9Xg0XsiV77Ekphh9b3R
	 383Ov7iOyXT8Lqa+UFe6bu+gTDih+qmcHPe74UEh9vhcaDtkXQ1GUL9tayDcrQq2Fmt22
	 +d7O6TWMhqj2XzwTVFmbmGw9Dl+2v5U8j487H/PlfQ9m6yTblLJVeeMomZyFV0+wN+/L2
	 NZ1naiRqafWyecm58oEHodpaGcT+HRuwBm0+tyFS4ao0fdPpAixuSxVz2YSuqA8mE0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795302465;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=urFVS682ubyxsP7IsuZLT4obni0tx+jX8VfX+5V6oKc=;
	b=UFinsi2NDpy11OQtzA3IAE67WPuLflaDtdQ+CGUxRIXw3zIsKmjGPMuYQrJPw/31R/px
	 lZZhccju8gzMydJul2oid1ovg5wzqVJM+F7Z4NjJcZAX+H0oT2QkDxEv+MUZQ4/rPrucN
	 bPBbwSjHwLQKNiJrqV9aNkiW3BdBN0qUQ4jXkiriE/LX9qLe3SLA4dmCHPSAmhK+7YnOS
	 P90HYqBsiikzP1W+p2lduBfIxXIV9AxQ3PTKtN/MsZ0F1lJJZfHMJqkg3xm7EfGe/qdo9
	 K7OJ4xh3ss9AbpT1fcV0yR7aXeWynkPcrfyU9NKnuK5e4e0bra5v9hEFGplC14QHoyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ipvych.com;
	spf=pass smtp.mailfrom=ipvych.com;
	dkim=pass header.d=ipvych.com header.i=@ipvych.com header.a=rsa-sha256 header.s=key1 header.b="qEqPvNL/";
	arc=none smtp.remote-ip=91.218.175.224
Received: from mta0.migadu.com (out-224.mta0.migadu.com [91.218.175.224])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC00C606A698
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 23:07:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC00C606A698
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ipvych.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ipvych.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ipvych.com header.i=@ipvych.com header.a=rsa-sha256 header.s=key1 header.b=qEqPvNL/
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=bV2B/6E/lvavoG65aDGkRjTcyyaWW50CdXXXYHwyoPQ=;
 c=simple/simple; d=ipvych.com;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795302462; v=1; x=1795907262;
 b=qEqPvNL/78FogA6YfBGqF/JXyKv6GnU+AOYYxSewZ2Kc5AQ0KwgA9LLLtfDk3uuyglSrfF91
 blNgcRt3qTJ6Wuc5aDXQ3pUY9dxQYhBQeJvvXpOzAOs3Afh5LbENBRheSLg58jDgPMpF+KoGcIr
 C8EvyqMv4eu/TzlKKcguFjK+npKWkkrxLYzENDSu+3TdCqEpl22eIXquBqFkBW2coPa+EmPTi+s
 EnzIZYUAdB1VBrrWCYHKbhR5HHPkrdrBsiIhziEdl/xax8WmWNWsolGKVbJnC42kcIUkxUOnd3z
 UNLKlRmmh25KQBWbaAnoHRNM8nxPtfGdnmcZRDtWJpkPw==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 4ed606daeaa9bb56;
	Sat, 21 Nov 2026 23:07:42 +0000
X-Mizu-Trace-ID: 4ed606daeaa9bb56
X-Migadu-Flow: FLOW_OUT
From: Ivan Popovych <ivan@ipvych.com>
To: linux-kernel@vger.kernel.org
Cc: pali@kernel.org,
	linux@roeck-us.net,
	linux-hwmon@vger.kernel.org,
	Ivan Popovych <ivan@ipvych.com>
Subject: [PATCH v2] hwmon: (dell-smm) Add Dell XPS 15 9550 to fan control whitelist
Date: Sun, 22 Nov 2026 01:07:38 +0200
Message-ID: <20261121230738.4970-1-ivan@ipvych.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <e4e133c6-db41-4776-a73e-e8e051eadec4@gmx.de>
References: <e4e133c6-db41-4776-a73e-e8e051eadec4@gmx.de>
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

Confirmed on my own Dell XPS 15 9550 running BIOS version 1.14.0
running "echo 1 > pwm1_enable" disables automatic fan control and
"echo 2 > pwm1_enable" enables it back.

Both 30a3/31a3 and 34a3/35a3 commands work on this laptop, using
30a3/31a3 as these are the commands used by the official Dell
software.

Signed-off-by: Ivan Popovych <ivan@ipvych.com>
---
 drivers/hwmon/dell-smm-hwmon.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon.c
index 5963f908972f..3645157620fd 100644
--- a/drivers/hwmon/dell-smm-hwmon.c
+++ b/drivers/hwmon/dell-smm-hwmon.c
@@ -1640,6 +1640,14 @@ static const struct dmi_system_id i8k_whitelist_fan_control[] __initconst = {
 		},
 		.driver_data = (void *)&i8k_fan_control_data[I8K_FAN_30A3_31A3],
 	},
+	{
+		.ident = "Dell XPS 15 9550",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "XPS 15 9550"),
+		},
+		.driver_data = (void *)&i8k_fan_control_data[I8K_FAN_30A3_31A3],
+	},
 	{
 		.ident = "Dell Optiplex 7000",
 		.matches = {
-- 
2.56.1

