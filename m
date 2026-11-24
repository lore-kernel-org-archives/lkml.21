Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795495361;
	b=jFrf48ppc6Lwpn+Gf9gnmOA6n+O4VHbVKS51CfWXB9vEPfp4U2atm9i4r7gYcoHNznwT
	 CWS7p97GHpjOjz3HkEAKx5FEN1ZgUmGfcpWXew+b8Ta47kwnz+1BNYsG/OUJppzDorUaa
	 3FFcttoOEUUpHd8EO65pF1Fvwg+4hEwrnCI8xOT+M1arCoAaQlwLOhtuWLKMchwltMLHA
	 OL6yQLFKvlIk4L4cITOgHeLvPZjvz5d0qarR2ACCffahrvNoxtM/FWvkRxBqwgMSEpD2D
	 JyCzFONY8tU8Bp+gtwOwIAOF8IH1372scph0jbFerG0NBpM/rgeBGStt7EjYh5RN7Cw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795495361;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=BvJDTcvuQOXXqhLPEh3cehXwTFehGneZKEkUbgpLgEI=;
	b=yqwXDcqkLDzGAc9WBy2a8qgR+SYFSqhvG1ttPegz2aTLtMwMgwkQ1YqNjydrsFOBphns
	 Lh3gRtKa2oP7/w/2daZ309WwSy3Ex/esZmqU8i5DLhzU52d3YWAs+jj+k8zcCeojVJpD5
	 raLyQnHKyvpwi0IjnDLijf65jTd1wGHrd9wtZxHihZu6P3DQyLZlAPkf6X7yNoPbgxBvM
	 t8X4dKQCBJMcPPagVxJcO2bhDkGJQvawsMXEZzx2s7V6NEdo4YMT1OB1bosPhwfGY/DSw
	 IPf7Ub+ATMcXK/a4elIS0iP5RdWHSqv7asPvv6DspnV8s/S+N2q39LW+t2h6dHWvYnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f7nvPsjp;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FDA8606A69C
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 04:42:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6FDA8606A69C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f7nvPsjp
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-382f4710a17so6969506eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 20:42:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795495361; x=1796100161; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BvJDTcvuQOXXqhLPEh3cehXwTFehGneZKEkUbgpLgEI=;
        b=f7nvPsjpauvB16GJA1/E791wYAjet/52LwfknhXpFK8NArBDoinDPLlSsHK6Dbunf0
         gNAXidNp36qWlRHZPMxs4Nw8Ffi5d+l22nDvd2rZv6Fm0yt47MESY58bM2MhsHPE8C9P
         NyL+MXly+IzAiGKabPX8r6vXwOg4HXBgMheRJkC5tG77Y3JiKsnH3tR6OJqc3RZbIfXG
         zHB9t51TPjMmGrLOYolD49iEJMTFskrfsZTPUaBmZGvh2m3yhzPvUbSA2MfFOBboA2pg
         GbTVedDF11Y2zXE7kC7wU5ndgTcyzQMgzj3T8aMGFIX9hiAsLwxW8ZdwvXzaWZl/bCQn
         HONA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795495361; x=1796100161;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BvJDTcvuQOXXqhLPEh3cehXwTFehGneZKEkUbgpLgEI=;
        b=LCZ82cV6jMps3ZrEOEAV7mIYLfW7+JQZd7lmEdK3T01JdIY8mUrD62lOYIbtM6/wFF
         jPttELmSdXsjVis71MuLqDzNvTuHSTOOhZC3MguLW4wYzUDaOG1C8NT6RDf0+Yr4zX3E
         NjBkbeMfbIHBbM6IUMQaA3MAVaxe4+heoVuHyOydCYz0UnR/ADK5FGj+7j6iPXJp+05y
         xFU0t3VcK3uAm2LANNNtOvfhFzT3ifxWNWBHE1tlUJLJ0WCw70CLtMC4okM5D53ILZeC
         FDzuTCvlT6x7J6C3njPnKhyoznjrf1JxZ0z8EB+vPWa1UYjLJMy7ooEWjx3TEM7bZBQa
         N+pg==
X-Forwarded-Encrypted: i=1; AL+hErG8GFBWfzGJraOh5KdG2GHlgialW1/8eq8YqlECsBoauaxkL4DNOMg0td7w4vkqEHtCkdvwfUk1UWAXwvU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9sfBH9yagh1Q0XxrTJa3IOJGY+WRlAbTgDyjZJFh9KdKcYADtS
	OqfDm5By4NQWhhStd91bqN8XJLiAupVY0UBX2ds0AYpFboj4tu3froUm
X-Gm-Gg: AZFdTZfYBer4JjmFXTBDGH6ILzsxk3d+SneWE/QI6He1Uu6eQa2YOw+M/XoNxLpWV5D
	gdVzVp2xfHMs8e0kxIQG2POlKMOiDUGNed+Cthw1L8U38h2I5WjmM9tTqfagc1J4jdUhMGo3m4M
	1mPPb5vC6620Y/unT339EKKBhy2D6Q2pcj5dyWHyry4wynw6MfTDef9rQMijI4wB6qgJjtf6YrH
	W0nEmBupFuM62OkhmAAMmqaY51tkSCvUvgFEyB6f+lSglrS/FH9TzcldtBri3RPJDfIu4gROD6s
	A3YOsFHy7IJsqfn1yxarJQMMkBEFz5LxIIXdR6bjEPnSrBR31JWoCX/L3p239dudkTOVLjnyR/i
	9qPEaIPTCKzpwx3rbGosuCHAG24toUQyiUnzr837QeVSRvXgYm9jhz/FjYtXCTuHvCjDSlt4Tbi
	5g8QGLEcfIU29QimfZqTVXd/BhK0NykdF7EqybUCdfiVlD+j1TluBH9+IRKkcmcdrLWDkwsydb5
	Ut3xk+/pduzPlimIBjTR9kWTz39/acvJT25mDzxm2Wh6ulkvvE5xHsB75/E0cga+GW2hXGSqGLD
	emiulzEAkDT6HhDQ405P1n0xmbj3xAiOiNVqoeptMcLhWphud3tP9mMa5W4lUVIVYDQ5vZrsOPc
	zh9IsGxRstztrVnZjLRgpCgo3dO3dNmrvb7twShMbMlZVQmFZz/ZNuXkvQBHsR+BF82ejjB85
X-Received: by 2002:a05:7301:160c:b0:382:c1cf:163b with SMTP id 5a478bee46e88-38571419d38mr13830003eec.32.1795495360522;
        Mon, 23 Nov 2026 20:42:40 -0800 (PST)
Received: from Mac.localdomain (198-27-228-154.fiber.dynamic.sonic.net. [198.27.228.154])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385d2b93dd9sm44950162eec.24.2026.11.23.20.42.39
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Nov 2026 20:42:40 -0800 (PST)
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
Subject: [PATCH net v5 2/8] net: dsa: sja1105: leave the pin function unchanged on EXTTS disable
Date: Mon, 23 Nov 2026 20:42:38 -0800
Message-ID: <20261123-timecard-common-v5-d669cfa034-2-ahmadexp@gmail.com>
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

sja1105_extts_enable() selects the EXTTS pin function even when disabling
timestamp capture. EXTTS and PEROUT share PTP_CLK, so disabling EXTTS
while the pin is an output changes it to an input and stops the periodic
output. This also makes the hardware function disagree with a retained
PTP_PF_PEROUT pin assignment.

Only select the EXTTS function when enabling timestamp capture. On
disable, clear extts_enabled and synchronously delete the polling timer
without reprogramming the pin. This also avoids attempting the
unsupported AVB_PARAMS dynamic configuration on SJA1105E/T when disabling
an already inactive EXTTS channel.

The Sashiko review found this side effect when reviewing a PTP core
change to disable every advertised timestamp channel during teardown.
Codex assisted with the correction, tests and changelog. Tests executing
the actual functions with stubbed configuration writes reproduce the
output-to-input change and pass with this fix, including repeated
disable, enable and error paths. No physical switch was tested.

Fixes: 747e5eb31d59 ("net: dsa: sja1105: configure the PTP_CLK pin as EXT_TS or PER_OUT")
Link: https://lore.kernel.org/r/179548551283.3135.17206659598806657887@kernel.org
Signed-off-by: Ahmad Byagowi <ahmadexp@gmail.com>
---
Changes in v5:
 - New prerequisite from the SJA1105 side-effect review of v4 patch 1.

Testing: 100 actual-function suites with 14 chip/direction cases each,
repeated disable, enable and error paths; four x86_64/i386 PTP/SJA1105
build configurations with W=1 KCFLAGS=-Werror. Configuration writes are
stubbed. Restoring unconditional pin selection fails at runtime.

 drivers/net/dsa/sja1105/sja1105_ptp.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/net/dsa/sja1105/sja1105_ptp.c b/drivers/net/dsa/sja1105/sja1105_ptp.c
index 350f958dcb2a..da35805152e0 100644
--- a/drivers/net/dsa/sja1105/sja1105_ptp.c
+++ b/drivers/net/dsa/sja1105/sja1105_ptp.c
@@ -816,9 +816,11 @@ static int sja1105_extts_enable(struct sja1105_private *priv,
 	    (extts->flags & PTP_EXTTS_EDGES) != PTP_EXTTS_EDGES)
 		return -EOPNOTSUPP;
 
-	rc = sja1105_change_ptp_clk_pin_func(priv, PTP_PF_EXTTS);
-	if (rc)
-		return rc;
+	if (on) {
+		rc = sja1105_change_ptp_clk_pin_func(priv, PTP_PF_EXTTS);
+		if (rc)
+			return rc;
+	}
 
 	priv->ptp_data.extts_enabled = on;
 
