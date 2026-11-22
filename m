Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.228.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795348610;
	b=HQrAWiLmd7SFQCrRT1t64ZpeNzgNsg4Kkv5o++EQFFvUYPgYVhW2WjraLkw//pICM+YU
	 D5WGTw2+X/eYeyZMCh7eHN3qEpm83XKKjIM661mUgC42dZpiZFoIjMTIKn++/LcZ882WB
	 3E+OxN4Mvoei3ssLIu2vOgmzNM3rnKQX23VfIsoY7ShVIInl9dAt2xcDDy8oU17o76akY
	 3SOtAws1W2VGT/c/7IzD0ouac9vILGS7p5EF4wLzD09ccLlmR4MjZ230SwWqJkGajVvES
	 Bx8ckLd61M2Ow7WVGyfkoFd1flfhJHwHvRIY1ozp4OI27pPzNHv3vwZ3HWZMxLcujKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795348610;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=KD9ED2MqTv4/+phnYY6+icCa/NG3RCXJ1b2cfyWY1jo=;
	b=HWAMYb9Rcbh665pUq61XSrh+LuWZdGBufAlAvt8ftROVZmXDpxNHusiYl7UDs113SM+B
	 N/b2DYRyLccznnAKzE2GyfYXq/s9pkpcvM46xOpxfwSBH/nj4BUD8e6Q81f+m3ehK8bdH
	 yJIaDZkkJg5DLOgkhuRvoFKA98H0I5bKdvRO3n17phQ8XpJEoHbitFaMhSLXUkUSCLCOM
	 oA05aQSHiyCLJ/2irVn6xbIBLLUNAZeHMv0n+KDxIN9ru/o7s0ARh8vRJfRG8zcy7s9xf
	 0TZHURFdJ6tE7am8jKwWEXTdyig++gEd1XgBXKVUIRI7G7pWy1T/C8uY7sb1kdyakxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LVZYJPUy;
	arc=none smtp.remote-ip=74.125.228.135
Received: from mail-ej2-f7.google.com (mail-ej2-f7.google.com [74.125.228.135])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC92C606A330
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 11:56:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC92C606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LVZYJPUy
Received: by mail-ej2-f7.google.com with SMTP id a640c23a62f3a-c516a1622b7so50646866b.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 03:56:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795348608; x=1795953408; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KD9ED2MqTv4/+phnYY6+icCa/NG3RCXJ1b2cfyWY1jo=;
        b=LVZYJPUyG66DPQyzdEv+7OKR8xiAXQqwH14IETsmnMqd6e/C4uASMjQeJInqJhn5XG
         q/e6YUjWlf+7hgHSUZehItWpgyUyZS+p4KPndeFw3aGaDW8WO5gWERrxInbsLqLI534b
         HMd+TfWM7AJ0Z6bNhGUII4audziihOGylEaTHct9/HOcJciuHtB4rE9YoVip4wN78604
         0rO9Wj9GzxmnQM/QBmP4gHB8IUAtAnwWOjM7g4aMRUGeYkSO21P8LQd3XV0ORYivpx6M
         SXv9uHMJnlIF/zsYrbx5AdVdA/+37T90H9En3meR/o4gb63QVp2cZqwCLCgn2+gZ9eZS
         Jkbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795348608; x=1795953408;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KD9ED2MqTv4/+phnYY6+icCa/NG3RCXJ1b2cfyWY1jo=;
        b=zSoWR3sJlAxjo/0nidRWI8z+QSLdVBoCtAyiAkhOt5sK2ivYQQ4+wUrKpyYYPoHbK2
         7zLS7W9M+HxIM0oZiLyXdSpd4P9/fxRiY5tv+CaOcaWGKTxSWKfYKkmWELf6r7ggQCyL
         Myp7LKv6MeCY8QJqGp9xKF7egCIM2RYQMd/vCD0GGPFbYyj+clNIHYe7IPOc8EOwG8pT
         XQk2AmZsTHafEGd3ELV5uq7C81FXbU2LLFdHY2DZ/xqfVB0PDpjpbZ7edcPwV5BT36ec
         EPo4jc/4VVOVTNhnJ0GXza4SmwfcfQOrrF3YWRi2079s4elypVXipeJsEjcNiOH3dFk9
         AP/Q==
X-Forwarded-Encrypted: i=1; AL+hErGXgxO9Wsxd3bHRZNPe9mrLCcoG/ZiPonBIl0KHCISTYPOEBMP4p63uop3bwvvmAXOxYEqoHkITbEG7few=@vger.kernel.org
X-Gm-Message-State: APuU4Z/OMXek+b3nTOjX4grAvumXyqp6uocitHXInhUkUTwY6eA1DO/l
	2yUXCvbkvYKxdh95+fuf4ZpB4NGBcqGRnGqd6d5kJMLZtfPz8z8dFSs=
X-Gm-Gg: AZFdTZd8Il4rfnmtiLHF/fo/cNuR6OzsDusn1zz7dcVCzkSmle/gTZ3sUwjGW/++PFs
	Uh9P0W8ho8dgCy7RwUxGrn6pfOHpzMBAaEhvmnd3NNuGG56T1bri5p6HWyLGwGAQcb78mii+TrG
	yOwvWQNL9f30l8Sy+DcbShMOm9VRki2SYULeHXVz61oJguV6SrzxoHNuL/ueXjKGzgAnWgr72vq
	RG+GZwGGvNkL5GB3apvM3K9UWc1l58iPNmFbZuQcK/E0AZCMkAyca1noPxA3aNLB0y33UZhASEK
	tjiawDWqZE7if/G0hL6vfeeTn/cUmXLh7UKfq+211xIQKzKTpEFJe2cVaN/I8pT2Byqib2Ey7Y2
	ITmJp/KFB9Qnz+/GSjI/ynqVKXJwMMzsdU+tDk9qBgGNpeui0vxI5hqapsdRVS1uWkXyeZLoQZW
	KpGLXDpP859q73kozEEsmd2Xyyme9D6ZiqLtxhQ6iyMADegV0EwfZfJDbLTdoDQfOji1bHRW/ld
	fnbREzNeNxQNdhzaZnylIPoAXnsqJ3aUYaqoBnDHdag2Htl9O8qLhWhWCz7OMApysZ0e33cThHk
	Yv7+yUONGtoyI45XZ2ejjmaiWKngJDUG9ES6LUg2j2+P
X-Received: by 2002:aa7:c148:0:b0:6b7:8444:a44e with SMTP id 4fb4d7f45d1cf-6ba37cc0b7cmr4214881a12.4.1795348608196;
        Sun, 22 Nov 2026 03:56:48 -0800 (PST)
Received: from llm-01.drunkbatya.int ([80.251.127.126])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba36e362bdsm3932556a12.5.2026.11.22.03.56.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 03:56:47 -0800 (PST)
From: Max Andreev <drunkbatya.js@gmail.com>
To: Badhri Jagan Sridharan <badhri@google.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kyle Tso <kyletso@google.com>
Cc: Max Andreev <drunkbatya.js@gmail.com>,
	stable@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] usb: typec: tcpm: fix missed frs_sourcing_vbus() call during FRS
Date: Sun, 22 Nov 2026 11:56:38 +0000
Message-ID: <20261122115639.2912666-1-drunkbatya.js@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <2026112206-lapped-unvalued-8696@gregkh>
References: <2026112206-lapped-unvalued-8696@gregkh>
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

Since commit 0908c5aca31e ("usb: typec: tcpm: AMS and Collision
Avoidance") the TCPC reports sourcing vbus while the port is still in
AMS_START with FR_SWAP_SEND as the upcoming state. Because of
_tcpm_pd_vbus_on() ignores this state, frs_sourcing_vbus() is never called
during FRS.

On Pixel 11 Pro XL after an FRS from sink to source the phone keeps
showing the charging indicator, and about 20 seconds later VBUS drops
and the attached device reboots.

Call frs_sourcing_vbus() from AMS_START when the upcoming state is
FR_SWAP_SEND.

Fixes: 0908c5aca31e ("usb: typec: tcpm: AMS and Collision Avoidance")
Cc: stable@vger.kernel.org
Signed-off-by: Max Andreev <drunkbatya.js@gmail.com>

---
v2: moved the trailers above the --- line

I'm not test theese changes on mainline, but tested on Pixel 11 Pro XL
vendor kernel 6.1 with the same _tcpm_pd_vbus_on() code, as i see
mainline tcpm.c is identical in this area.

 drivers/usb/typec/tcpm/tcpm.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index 51e5c72799f2..5caa649a92f1 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -6889,6 +6889,11 @@ static void _tcpm_pd_vbus_on(struct tcpm_port *port)
 			port->tcpc->frs_sourcing_vbus(port->tcpc);
 		tcpm_set_state(port, FR_SWAP_SNK_SRC_SOURCE_VBUS_APPLIED, 0);
 		break;
+	case AMS_START:
+		if (port->upcoming_state == FR_SWAP_SEND &&
+		    port->tcpc->frs_sourcing_vbus)
+			port->tcpc->frs_sourcing_vbus(port->tcpc);
+		break;
 
 	case PORT_RESET:
 	case PORT_RESET_WAIT_OFF:
-- 
2.47.3

