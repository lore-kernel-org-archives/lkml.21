Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795711342;
	b=oPmium1QJp5r55aUMLs4bO+eBQlUExXlqKG0YLoXq3z0DuBasBInv5qCqD7uHLNM9lsA
	 NZJC1S/8HYHNxI91GvTcLjtXn1wN9MYNWdHtPAPNasB1m66WwUrGMpsaRoJi9tudhK9bS
	 O+kLdCVT9siVAvXT5QoHXh96IdLz7B8hPVblKWVeZC+2UWnljAiFqPx63L8mXbw1IKjxs
	 3YK8qKlhnqOvrCtQknV/5Zj2DNIFhOPzKvpoE4AAgsT1Sbhbign8N9Z+Zjrd2l09E7cX6
	 60LpLjtVklEyogm70LW/LmzCkj2gEcJDt5P70r0VJcGgwISb3bO9/mjJJCxxkMiRcMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795711342;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=IQdmPyCid0NZnSr6leV+RginXKpXjarbIm4H9OSUfg0=;
	b=A/zrOetxgXcyzb7Anv9LPeKv1oyjc1HyjvkRod5FhMIL2CRquuvOkMdjoBrgROPJA2Mu
	 /IMfE4VnPYAXd57+Vajb439/5zCyBYy/7YIo5CcQiXnaW2e98WilkEg9XvLebI1DyPNp1
	 AeMkqCOER1z7PTRRverhPpVXUuvz4X/HCqRoZMDloav3cWvOyfgL5m4f7TWVwoLaAQ4I3
	 VB2JlP8Qmxp+3//pNq9ndqmD8EI5AZ8CIU24Ab2ttvc3VvFXB5dGjFLvk1MhlAspWz8k0
	 liBnm31RiFWynoAxQbslCJEn755WrNITqAAdl4AiLSsTcW4GAulUrbBgNTCfRRqVIyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yxIPCSW6;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1302606A338
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 16:42:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1302606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yxIPCSW6
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-3869f03af6aso6334297eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 08:42:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795711341; x=1796316141; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IQdmPyCid0NZnSr6leV+RginXKpXjarbIm4H9OSUfg0=;
        b=yxIPCSW6quj34kjCiJfIyWJ596L+aOnNRYTXdtCNIFNoh6KQi2+KZLy4uutKn2YjSX
         pz9AqaUdmP5PwbmwbwDqc7n02KRoalhgSCpbTlMvYnI0AxSuK0EM6nzR+k99gmtdtMXn
         Nc+b28POd71wkpFt9FMTGwEG8FVuqRrow8mCl2RMCBkOOGTVnfB0hOL9tkxgRaDiQZr9
         8lFb11+C+48X9CKisCmKDBWlybZadvPoF80GxkwvMERQQ82o570k3KRSthP2Cy2xrcT9
         ehiTUDzy6mRmmiiw3521DinWqpDpfoZqYZs2JRdYUUNX6giGy7G6rr7qQcBHhMfbx81z
         vs8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795711341; x=1796316141;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IQdmPyCid0NZnSr6leV+RginXKpXjarbIm4H9OSUfg0=;
        b=Lmt3XHG5GovwEfJw9sp+hTaIK/J60SuJDu/c2lRF8oaddyIrn3anoy0KA9/2jyC7hH
         xqUhgrt3PZck9Jry5o+WVfhUAiN1SmoVFZqebmHP+X6veUH6osie2HnLqd7pPzckHYKo
         bXh4wJku2doCRAxpHJJ5BJDsIuB2otEfJbAmENdcTmgDHI8SfGziz9QG9RJh5ZDS/It+
         GN6nxuXYf1khwEZMesGHmWvqj2TcWRekdN1qiw9/0s42KH/lSMfTDfdB9FnIh+/rIeXa
         /SR3fVjNUVJ56OWAmdywpQHAcGOiKe2GvjhsC0himEWU/M8rLPpEfhsphs+Lw0q8pJ/l
         7dFg==
X-Forwarded-Encrypted: i=1; AL+hErHSqEezNOWdEd4gBGGon5dC0Ws16/ifw/TUbu+L8dB8aYl/CM/qk9nYllL8Pf6XB+gu5Wp3IWYtBdVKIGg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8w6QK5DdWCjTIRxWbCudi1m1qqXLDzXnq4Ui88p/J9xXt21f4S
	NEGOY8ez1y1aZJQqX9JF27+ye5pJIj75YBx5bcgREq6PYFNuo/K2NL8l
X-Gm-Gg: AZFdTZemxe6K6XG3aZ1aa1f4RWzJnGXZSe2YBqVvL4MHGxuPivQwwLkWMNBHRQvxq16
	oD6QvBXNi9pVIsDklimL79Qd+5f/NuUvrAUxKpxR8IZ5ehh8fjPUuIq70IabbYFdkdoy+nIpIuj
	aMvl3m5ibxBweq/qzixo0r2dIm+w96J1sACaRxmU0FnQ2Wpur7P3Fdpm2oJa9wM59S4qtc3eDWp
	at8H896gyHK3sJfbd60eEDyKW9dIRpb9fUonZleodH6yXctsPZowY5zOSzT7rYYRWXePo65vIeH
	14U6pRbYNYF1m7LS4Nv3SFHN8HFKewMbD/QjQBd+gwgW/cYmE/FJVbMmdcV9ofeBIfsY5wuU5n8
	j/IzfU119TVUQj+yDqfGDLLR0zibBKDkUP1MgTy+VdKqZlJLIOx6VAX6cpcIcA9ecsnI8ItUMkQ
	Sa9AVo9sajDh5lO+sa5Leih6eNQebe9yBJxn5kba3KoRwNCnxv1XcR4uad+TZG15EWrivEwGzVD
	DnwLZZ6ekPVkyKIsDLTMog2tg4cfDFthSUBoE5XhUpDxniLtGPy825WBcHTJYIGjyGgEdYn6n5D
	IioMiXCx7wP4fg7euKioM/M4e/UEuSfd4ckZnpfLMWvbPpSWV/EtSzfPcnf+MqhNoyBnNk3AOmY
	onOHaxilPScGXOob24fTw6Uw7SjGwKdVhK9ziiboOLDZL5B0nZ1Plcy6dwcMJizeHUzRfEv4k
X-Received: by 2002:a05:693c:880c:20b0:386:ab85:a011 with SMTP id 5a478bee46e88-386ab85a718mr14031360eec.27.1795711340923;
        Thu, 26 Nov 2026 08:42:20 -0800 (PST)
Received: from Mac.localdomain (198-27-228-154.fiber.dynamic.sonic.net. [198.27.228.154])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm115299825eec.3.2026.11.26.08.42.19
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 26 Nov 2026 08:42:20 -0800 (PST)
From: Ahmad Byagowi <ahmadexp@gmail.com>
To: netdev@vger.kernel.org
Cc: richardcochran@gmail.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	vladimir.oltean@nxp.com,
	vadim.fedorenko@linux.dev,
	andrew@lunn.ch,
	linux-kernel@vger.kernel.org,
	arkadiusz.kubalewski@intel.com,
	jiri@resnulli.us,
	jonathan.lemon@gmail.com
Subject: [PATCH net v6 7/8] ptp: ocp: match ART DPLL frequencies to selectors
Date: Thu, 26 Nov 2026 08:42:08 -0800
Message-ID: <20261126-timecard-driver-v6-7-ahmadexp@gmail.com>
In-Reply-To: <20261126-timecard-driver-v6-0-ahmadexp@gmail.com>
References: <20261126-timecard-driver-v6-0-ahmadexp@gmail.com>
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

From: ahmadexp <ahmadexp@gmail.com>

The ART input selector named 10Mhz is recorded as 1 MHz, although the pin advertises 10 MHz. In addition, ART pins share a generic capability list that advertises IRIG-B and DCF77 frequencies which the ART selector tables cannot select.

Record the ART input as 10 MHz and give ART pins a supported-frequency list containing only 1 PPS and 10 MHz. This makes DPLL capability validation agree with the available selectors.

A coding assistant helped identify both capability mismatches, develop the source-derived regression tests and prepare this changelog. The tests use the actual ART accessors and DPLL validation with stubbed registers; no physical card was used.

Fixes: 09eeb3aecc6c ("ptp_ocp: implement DPLL ops")
Signed-off-by: Ahmad Byagowi <ahmadexp@gmail.com>
---
 drivers/ptp/ptp_ocp.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/ptp/ptp_ocp.c b/drivers/ptp/ptp_ocp.c
index 6bfd5792768e..040518895176 100644
--- a/drivers/ptp/ptp_ocp.c
+++ b/drivers/ptp/ptp_ocp.c
@@ -299,6 +299,11 @@ static struct dpll_pin_frequency ptp_ocp_sma_freq[] = {
 	DPLL_PIN_FREQUENCY_DCF77,
 };
 
+static struct dpll_pin_frequency ptp_ocp_art_sma_freq[] = {
+	DPLL_PIN_FREQUENCY_1PPS,
+	DPLL_PIN_FREQUENCY_10MHZ,
+};
+
 struct ptp_ocp_sma_connector {
 	enum	ptp_ocp_sma_mode mode;
 	bool	fixed_fcn;
@@ -1385,7 +1390,7 @@ static const struct ocp_selector ptp_ocp_sma_out[] = {
 
 static const struct ocp_selector ptp_ocp_art_sma_in[] = {
 	{ .name = "PPS1",	.value = 0x0001,  .frequency = 1 },
-	{ .name = "10Mhz",	.value = 0x0008,  .frequency = 1000000 },
+	{ .name = "10Mhz",	.value = 0x0008,  .frequency = 10000000 },
 	{ }
 };
 
@@ -3138,8 +3143,8 @@ ptp_ocp_art_sma_init(struct ptp_ocp *bp)
 		.board_label = NULL,
 		.type = DPLL_PIN_TYPE_EXT,
 		.capabilities = 0,
-		.freq_supported_num = ARRAY_SIZE(ptp_ocp_sma_freq),
-		.freq_supported = ptp_ocp_sma_freq,
+		.freq_supported_num = ARRAY_SIZE(ptp_ocp_art_sma_freq),
+		.freq_supported = ptp_ocp_art_sma_freq,
 
 	};
 	u32 reg;
-- 
2.54.0 (Apple Git-157)

