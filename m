Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795495368;
	b=UrujZMknAYQbIyvUAKvCWUKQEFxw5S7t4cWSO5v9uf7QX30CkYA1y1r5mhDmrdZBeRt8
	 OH2Vl81C5drB9v39a18mn8ins2Ou+01O+HF+UYmiUx929BI1ptafLvrN6yGP+pXCEvtAj
	 zZdmakPbTcSEBRZX/qoKkOOhVTIAIcixVnBb75bO50RqIfJiRs4Kp3XjPGToCXuIj2qn+
	 7qhgvlD5yk8xkX1JRAbbr5gOYJqzs2Rt4NPRgjZ/e0kvsjqDXpWJFfIkUB/vLNQTILqyl
	 k+btfRPacYXEQUu4RjCudMxEsyEdUP2SYtdJYhKOT8X88wp5xAEKFJ+51LB4+KXOt4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795495368;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=h8MKC8Lxgq/9MW67tGoN5njDnP7Mi9uawf/28NfiV+Q=;
	b=M6QaiU3W+wJ4gla7e4XKlyo6oOX6WhwXwn4z6o0GHWfImq1ub0DVNQ8gC1I7yn3t9Mh0
	 KcfBP3EFYcCwx8yeSLIAZJmSRa3EILGyn1nJHlc6MIRLveNte8Yst1hrlfydOFfcQDfG+
	 fHz94iOSFV1dTLYwzhk6W3ohouU+FTE/2HlKYggdW/rTpfoGS5yJJjXA3nMfKNdvZdxEL
	 8g2nIYzLGuyV4fllMoIOVMN5XGoA7YTmBn+0/7nvy+sFK+begpkkRsPUjtGke9LaoKli8
	 I6Sv6ah4Nu7jcugasKg8sI2k97eQU/nzU1m6wB9P+N0WfUDxRjoZgAqEKZ+J92wUCwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kypXJeUH;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63BAB60A261D
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 04:42:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63BAB60A261D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kypXJeUH
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-15dd124bbe7so3722179c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 20:42:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795495367; x=1796100167; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h8MKC8Lxgq/9MW67tGoN5njDnP7Mi9uawf/28NfiV+Q=;
        b=kypXJeUH1IswXcwnOpxZ5nFz/QhCTLna/YbDFxvbtQa6TMQFBuYd+WllGHDHEvOWi8
         ddK7p6tc67DsR5MSOvfFaHMYguRs7gfHp0zTGkCgGE+cepWrYHRMj9jPKdH9aOoUUkjo
         fxDJHTnglOroCLgM4u5F8zguOZGqjxg7h2FBaUJ97CQQL0s7oqZ6bMl4hkHcd2lEZH4/
         x8q+SGQnqk8+oAJ2ZA7hcEFJ/jpewlYqaLOsOVGaWOI9Lt7mHz49ONjDVUvQF7rOjXU6
         VhC+VGSWsNnAqy/vcA3+tT0r4s1m1beYp3WufCJp64VKbENaoVqHp42WggC4gDmR4P3s
         6M2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795495367; x=1796100167;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=h8MKC8Lxgq/9MW67tGoN5njDnP7Mi9uawf/28NfiV+Q=;
        b=AWzEoBFHA1n19mwPV7OMmsrfKOGD9ZTjNbEFIyOur8hbq9YUfEJTRAuMshix6viPs2
         7nRxiUW/IO4XOrLzWoSREcVD/OfwCNDkcwe05K4yl1WzgaeN44KDSqgT477LCE3Hbc+O
         kTPjkwIP7H9enP678YkXtc0R+36qKwyrbmjjUgt12g5Fgtb9t6jHDGbBlvLgAXaUkOkV
         GJbiAoR+PdmDY+tsxBDFoEQMZciuzICdzh4D/6o+8BWps10eudZ8piPuiFJavo9UUbmq
         AHOb5G0412UBOchHFZ7MynBM1QXKE7fVkTGhmXOZrBQ2kXbR6s0uGe6ACs2Cit1miFHy
         LnEQ==
X-Forwarded-Encrypted: i=1; AL+hErHW+r5MIRek2spYQpkSK3Fmi6QvdlJdOvqKkgwm0afW2i7VJNCj7rJk5ByLA4Dhmk9XepSgjRYshKMXJGk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8SjtY9newPg2ddmDb1XAsAGPeczUbDXz7Qq9j0ksHct6QAy5Ae
	bgSzSWYO1+pbu9DbRFYbn3jUQd3cnbwPYe1r4EQkKTtxZJK28BCbgKJj
X-Gm-Gg: AZFdTZdjEEGAWQ0AyAfWA4tAV4WhsYLVqOcMaF6yucV7gVbuvuoAt7Ufh5Ue3CnOuK0
	cOB7SactC0dSdsXKvDgWlfgCgYfdf34JkoEbGO8IWlMEVmrBZ47ONlCCCgehzM8DC6DT92JLfl0
	Xf4oL2nEgu2zmw/koOImcYEwtW1aWLt7wZJTkAaGJVFNK37erhid33V1YIS9fcrwMte6ndTbOXw
	W1srfNzl9fvQHlWXIaCVZgDUc3+l2w7um53ac6SZI68ppMQxa4kWNDrRpBIzULWtwIFbCZw5FuA
	/8f0PV6v0s3o97ALHLGF+8yWsi6dNXojfUW/14Hm6MzgMRfbIK0sNslrFILnbyesYwsbCmzp7bR
	cZKD7XCa2C/hGUELkvmVFsx/IIDQM9f25hrZbfdCiOUl9LwX4ZRkQeQtAcmSvtiyqUbKlNZ6FdC
	OSMKfvHl1YDhsuocjNTr2QapmwJ0o338NPIOo3uQMu8yvKarpzSukO1IaxiWQQ2ZHJaFFVod7iq
	HbI3fK1BRZCzq2o+nn0w7QYlGxllX13Wz5IQ1V3kOMFCb5gTKOaijP25Z5HgOHyLl7GLGqbXrr6
	z9bJH8THM0rosSfm3h6P7dcUoNuFumD9fOLAjBofk9al0SndqqWE9HSNqAxrNg/HbJ0+duLkMyI
	ceZ6a7HY5hihGC2o5oaMooWAfccIPbvq/UeLGSynpB3AvgAd4D0u6KW4olPEvnTZeHQtsM2Lh
X-Received: by 2002:a05:7022:285:20b0:1b5:75d1:3c98 with SMTP id a92af1059eb24-1b575d13eeemr4181161c88.8.1795495367344;
        Mon, 23 Nov 2026 20:42:47 -0800 (PST)
Received: from Mac.localdomain (198-27-228-154.fiber.dynamic.sonic.net. [198.27.228.154])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55682d301sm32217346c88.10.2026.11.23.20.42.46
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Nov 2026 20:42:46 -0800 (PST)
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
Subject: [PATCH net v5 5/8] ptp: ocp: recover disabled SMA inputs when binding the driver
Date: Mon, 23 Nov 2026 20:42:45 -0800
Message-ID: <20261123-timecard-common-v5-d669cfa034-5-ahmadexp@gmail.com>
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

Disabling an SMA input clears its mux field and sets the software-only
disabled flag. After unbind and rebind, the hardware retains the cleared
field but the newly allocated driver state loses the flag. Direction
initialization can then report an output function for a connector with
neither buffer enabled. This happens independently of DPLL support.

Recover the disabled state from the mux enable bits when initializing
direction-configurable FB-style connectors, including ADVA and ADVA X1.
The existing direction selection picks an enabled side if either side
is enabled. If the selected side is also disabled, neither buffer is
enabled: represent this as an input with the None function. The mux does
not preserve a direction for that disconnected state.

Do not write the mux or change fixed-direction firmware's interpretation,
since it does not provide these enable bits. Keep this initialization
fix separate from the DPLL frequency-reporting correction so it can be
backported to kernels predating DPLL support.

Source-derived tests reproduce the lost state with retained mux values
and fresh driver state. The corrected initialization passes 243 modeled
FB/ADVA/X1 rebind states with stubbed MMIO under ASan/UBSan, without mux
writes. No physical rebind was performed.

The issue and missing earlier Fixes tag were reported by Sashiko review.
Codex assisted with the tests, correction and changelog.

Fixes: b2c4f0ac53f3 ("ptp: ocp: Add ability to disable input selectors.")
Link: https://lore.kernel.org/r/179538006912.3135.16971430532149423594@kernel.org
Link: https://lore.kernel.org/r/179548551472.3135.11972018356692852897@kernel.org
Signed-off-by: Ahmad Byagowi <ahmadexp@gmail.com>
---
Changes in v5:
 - Split initialization from v4 patch 3's DPLL frequency substitution.
 - Use b2c4f0ac53f3 as the earlier Fixes tag for the lost rebind state.
 - Describe the DPLL-independent behavior and backport scope.

Testing: this patch alone applies to the net base and passes 243 modeled
initialization states, without DPLL calls or mux writes. The unmodified
base reproduces the lost state. Older trees may need context adjustments.

 drivers/ptp/ptp_ocp.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/ptp/ptp_ocp.c b/drivers/ptp/ptp_ocp.c
index df1a428eb2fe..c4c9d3501edf 100644
--- a/drivers/ptp/ptp_ocp.c
+++ b/drivers/ptp/ptp_ocp.c
@@ -2932,6 +2932,14 @@ ptp_ocp_sma_fb_init(struct ptp_ocp *bp)
 		reg = ioread32(&bp->sma_map1->gpio2);
 		bp->sma[2].mode = reg & BIT(15) ? SMA_MODE_OUT : SMA_MODE_IN;
 		bp->sma[3].mode = reg & BIT(31) ? SMA_MODE_OUT : SMA_MODE_IN;
+
+		for (i = 0; i < OCP_SMA_NUM; i++) {
+			reg = ptp_ocp_sma_fb_get(bp, i + 1);
+			bp->sma[i].disabled = !(reg & SMA_ENABLE);
+			/* Both buffers disabled: report None. */
+			if (bp->sma[i].disabled)
+				bp->sma[i].mode = SMA_MODE_IN;
+		}
 	}
 }
 
