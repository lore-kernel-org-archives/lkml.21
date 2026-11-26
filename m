Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795711341;
	b=dA5FuH97Bj4jss4RBbLDhoUHl5+QQrR3YjL7SK/vSIZyQ/tf7JJ5T6cjveX/dPnod32r
	 0u0E0OazmCHZTj4haebJmEbWNro5WvXz/YphWu+nAdNLcNMluf8Wmjxs5t1+3CDVh13r4
	 vif7f/6dBMHmAxnO9Bw8Ntq3Lkgk0IkAWCEn6iG+Oh6lixdngKIcacFXNnXdI9YBAj39o
	 8Yff/W/2nORBRlKPOCct0c08q1PGE6mxxSBVtDrlVOdMpktFazIxsTdRLO0DZ7wDQQKal
	 2SxF7hxV9p/og+5iO0XKdNcXpKkLRumHNkAn0/oEdcDPBAyju6x16sjFo0c5kZBxdfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795711341;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ieM/Xh62gUthQximT6l4fZxjNe4iv44Bu/bWfCxIhh0=;
	b=3+Iy9/A+YvIW/RRGIrP0pVSRIlkdxCA6PBo0s+QrRi6Ayc0cjRUbjbZj8HtY6gRQLCJU
	 dpZ7kajeuMsqV4eR/qVXBDdNP2R/IX0V7IJJ0bvcDwDEFUXRAESC6a9JglK6TFYqnJHMj
	 3zXaBcbkaNRDEi+RP5Bv/yGBRNvHlKMw/Cqu8wgbWE2vGHmNRisF+QGZs+SZVFga3KoeJ
	 grr1PIVSdKhRNse/Wqgf7vIhDEVjUzWTv/I+ooJG/UmHQdVYAyFoG9ey8QnRF3tiumuIC
	 JRb3rjgem8VpZYxcQLq3vR/IcAfQQLsMH1xFZs6uMxNN08kvRO6bXgIhYOyDstHcucg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ykVmHvYl;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85B7660A3809
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 16:42:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85B7660A3809
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ykVmHvYl
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-38692f62b22so9258069eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 08:42:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795711340; x=1796316140; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ieM/Xh62gUthQximT6l4fZxjNe4iv44Bu/bWfCxIhh0=;
        b=ykVmHvYlbr0DkP4R5glQ6QXXEtpXluiYENvL+TXKW9Zat7vmOqhmVnjgknIfFAm0nV
         Ey6BlrnuvwDlCtaOHfvC2MU1tj36goSkqEEedS2PfYUwyRAvf10/0x78iGsLlY7OGnmV
         sk8jznQ0XnKBzvnAV4uLAqRf4kiuhDpccRxAJ1rhCKgSmBDb8GtJ8CWmEA3oUIy8re57
         zuCEVQ4W4P2yIjaHQxa293DOVB9A7elBolSMw8FxBpx/BWLsdNkEmN41Ps4S+ipkP37z
         jiXW3yRfWO47Qx6zH4NI+gi+wm3FewaV4mSmhptjXq+WjZWER5duGETTXSPGs++TkMFe
         K0eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795711340; x=1796316140;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ieM/Xh62gUthQximT6l4fZxjNe4iv44Bu/bWfCxIhh0=;
        b=CkN7MZ0pYMWOOEhW0EvQip6nqB6PSF6LB9TSp+uI0+FsCKqHG9X6yLdBxjtHVK7JxM
         9QlfSXky1raCb06BT/ii6AlSj/DwM6fpKErXMoqPt7rtTcIS04jIl2F+VWbt27qcKC/J
         FEpBdDFOCshwjAY7Fv2H+Z8iqBv8lIo20Axqc1Bid99jbPq2/FARcKGLDRmmCVETQa0c
         SJK9LPOSD7zs55BcuDamHWXizg5aJNAaRIrVomfGmGEgfYMYlcxOgLqirFW5QJUF2YOq
         lhClmqxQAfWw80hzVTjtPXKjSCmkkGk+eJqRjrKRy9HdKv48Mzt25NA9X/Z7/eO81Wq6
         Ikmw==
X-Forwarded-Encrypted: i=1; AL+hErF9B/ztTv0CZDEy3iAc3mhzk9fedkuw4WcpbSFfGtaS19VZg7X3NpBjTCAYvDyU6wzsy5JFf4R6wflzC0E=@vger.kernel.org
X-Gm-Message-State: APuU4Z/m54AWAqaMs8ZXk5LyY+U94IoHg6G9M2twXXBElBhssheaHtUE
	7+z0xiUiKeHy9vI4UBeeOI0uWXofEUb9ZmF4qydvHbJsYYIqnv2voneC
X-Gm-Gg: AZFdTZdZZQNhxO3uZcixMriAtkc1LfwP/SscqtcsrwLpCk7knWYvfyHo1Moz+Yh1/vX
	PpkAe/nUxBk6aje6Cglu1kx/umSkCHk7+juz0ESaPXno8vQF6nYYUqEByfsCEtCEmhZIlVlPK68
	Fk9iQgl1UcHAFZEPn3C0VqbTwkoc706/K6QuGauT6p9dQKmGB1aIfKk+VaDdqck19nGl5oTXe08
	PUpEzN0iFEL7vWUOiKsg7USN6xvj+rWiGQr24R+0mVvlCCQldc6nvL7RtMm4fIk/kaNNdbtQvHM
	L3foqxxHJ9/IYpDpNzKpjk3eKuWT/T2QK0oUsUau6RCyM00MQH4sR4ud8ZEiYJn5p4wxSJHsXjI
	C10H+zwkikNVyzwNAdTTrUuQaB7vrIvUcZ8vqNaY+44eoI0wlvmmxgM985hLaxuRhqUpeTHbl7g
	+a6fSjhELQ5GIl4bCRx6lT97CrISayi43l9JvluBS29gnb0wdHs3cu58aRpXfI3d/V36sk+AqC5
	UJ09gXchAm6AGLsVXkQXRw8tvs/oW8qzhAxct+90Qmspn8Ij2DlRQ4j99eSp2co9rOxhX5DvHdo
	/qNFlp+w+DqwecyaDLGG7N305pFdStIhXmAGryduR306EeU/HwBa9BWpyP1pdGre2ma+dug3Mem
	b8NpAywKEMqQUwGiU6PQuP6vCf2t3aB0qJK1Fd1xPvpjKyEMKmufiUTqz10P0qhkUum7dsLzx
X-Received: by 2002:a05:7301:6407:b0:386:2300:db04 with SMTP id 5a478bee46e88-38623101ee2mr21570735eec.22.1795711339632;
        Thu, 26 Nov 2026 08:42:19 -0800 (PST)
Received: from Mac.localdomain (198-27-228-154.fiber.dynamic.sonic.net. [198.27.228.154])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm115299825eec.3.2026.11.26.08.42.18
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 26 Nov 2026 08:42:18 -0800 (PST)
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
Subject: [PATCH net v6 6/8] ptp: ocp: correct the DCF output frequency
Date: Thu, 26 Nov 2026 08:42:07 -0800
Message-ID: <20261126-timecard-driver-v6-6-ahmadexp@gmail.com>
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

The output selector table uses 77000 Hz for DCF, while the input table and DPLL frequency list use 77500 Hz. Requests for the advertised DCF77 output frequency consequently fail, and reading the output reports an unsupported frequency.

Use 77500 Hz for the DCF output selector.

A coding assistant helped identify and verify the selector mismatch and prepare the regression test and changelog.

Fixes: 09eeb3aecc6c ("ptp_ocp: implement DPLL ops")

Reviewed-by: Vadim Fedorenko <vadim.fedorenko@linux.dev>
Signed-off-by: Ahmad Byagowi <ahmadexp@gmail.com>
---
 drivers/ptp/ptp_ocp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/ptp/ptp_ocp.c b/drivers/ptp/ptp_ocp.c
index 3457c351958d..6bfd5792768e 100644
--- a/drivers/ptp/ptp_ocp.c
+++ b/drivers/ptp/ptp_ocp.c
@@ -1373,7 +1373,7 @@ static const struct ocp_selector ptp_ocp_sma_out[] = {
 	{ .name = "GNSS1",	.value = 0x0004,  .frequency = 1 },
 	{ .name = "GNSS2",	.value = 0x0008,  .frequency = 1 },
 	{ .name = "IRIG",	.value = 0x0010,  .frequency = 10000 },
-	{ .name = "DCF",	.value = 0x0020,  .frequency = 77000 },
+	{ .name = "DCF",	.value = 0x0020,  .frequency = 77500 },
 	{ .name = "GEN1",	.value = 0x0040 },
 	{ .name = "GEN2",	.value = 0x0080 },
 	{ .name = "GEN3",	.value = 0x0100 },
-- 
2.54.0 (Apple Git-157)

