Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795091845;
	b=oO0JU5e4vNZurSiuW8BEZtJLoKC6k8JpEgYdFMQ8XJXNxmJRllpgml4883tvFl5Z4Sfq
	 X7adwqnsJvZRBediFvQA1J1VC4Hc1ITZhZza0Mqcx/t/1mrCcN2MvPbDOWgYHd5JViYzO
	 p16d5MAbtOegl2DyPzEScqi2wzMUMePzX6GsLjsTcNS+BFe2QbxRqXR1Y1SLVLWMaC4eh
	 6tQc8ZnjCWuIN6TTlS5tBU1tLRUQ7DqqVGa8rd3xKUDL306R1L9/4jBkBMFzeOthkMPrz
	 E0vRMvy6uXLs0MUXXLaSIB9DcAhsbOOAtDxKGClLQJkc5jorRxcjiNRdaLucBPuWGrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795091845;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 In-Reply-To:References:Subject:Message-Id:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=RewlOcbB01O0OqmI8Z6D5CN2IGi7PIPdjkslLrrCe4o=;
	b=LqhwM2nxFY4PhrpjLcIzhJNTfgG2FmMiCdWck0GIKczW0RN1ctBqJkptFGhDqX/bYcRR
	 ANrKmtWdtBFWHuWI7mbMFHJ/wd7wcSHRkxXW6yrySx/thIl/8IQ4gW5c9PoPdZU3JkwfH
	 qr1WkXYWwnHuoLrK0Oi36fri9nMqzCQ/syKU7HShKpLvEzfvRqASycT3rrB7vepZen5qo
	 lVIdQ8KVqa6NWloO+q97NtF0qiwQkNRUAgqvrg5Jn/1TyGsiKYHKRcYYcnlx3YOE2jDym
	 PwQz4DjQwWv/vBnvmupBDMi0vjBNshTVkDVQg1jjo6l3kaX4DGpnZYWnh2JBuZUgdlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=vQsBHKnH;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BCF3606A33D
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 12:37:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BCF3606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=vQsBHKnH
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 770304E41667;
	Thu, 19 Nov 2026 12:37:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 43DE560237;
	Thu, 19 Nov 2026 12:37:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7E78A11BC05F4;
	Thu, 19 Nov 2026 13:37:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795091842; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=RewlOcbB01O0OqmI8Z6D5CN2IGi7PIPdjkslLrrCe4o=;
	b=vQsBHKnH2F+3BD3ii1LWJduaNBNkvghEEFdq/7M/Y2U37Q6O7ORJovBxUs4vfUutmGXF2L
	tzDqOn+e2cnR176XbqxznKmZALEXkp00vVJ5woW1AXm3WgjNj76DoKmo/zRaNlFRZl2bZu
	+rI1cIC7tQmAP71eCDWT3ChsSaFQ+Sbm3Fa+PCakeBRNH63tVU7Mwywgxma9C+MjBhpuOj
	diHeQGY7pVyF2CM2iG7nBiuV+ivnqJtnpuub+XZzKkPwrQhhG1LG1ooh0Hnq/qa+LXwX4D
	UBlo2OCy0dC82Pt9SI2ohtB/NWDx9Bht1ctzD0GZOk0h7dqUO4UWVVJ8FjZ4mQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: linux-mtd@lists.infradead.org, 
 Zhao Feng <zhaofeng2@cmss.chinamobile.com>
Cc: richard@nod.at, michal.simek@amd.com, linux-kernel@vger.kernel.org
In-Reply-To: <20261109052724.1032-1-zhaofeng2@cmss.chinamobile.com>
References: <20261109052724.1032-1-zhaofeng2@cmss.chinamobile.com>
Subject: Re: [PATCH 0/2] mtd: rawnand: fix GPIO CS descriptor leaks
Message-Id: <179509184137.2889394.1523547791130557130.b4-ty@bootlin.com>
Date: Thu, 19 Nov 2026 13:37:21 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

On Mon, 09 Nov 2026 13:27:22 +0800, Zhao Feng wrote:
> Two related fixes for GPIO chip-select descriptor leaks in the raw
> NAND core helper and its in-tree user, the Arasan controller driver:
> 
> - patch 1 rolls back the already-acquired GPIO descriptors when
>   rawnand_dt_parse_gpio_cs() fails midway through the cs-gpios array;
> - patch 2 releases the parsed CS array on the arasan probe error
>   paths (invalid DT layout and anfc_chips_init() failure), factoring
>   the remove-time gpiod_put() loop into a shared helper.
> 
> [...]

Applied to nand/next, thanks!

[1/2] mtd: rawnand: parse GPIO CS with devm_gpiod_get_index_optional()
      commit: 8abc246c1ff1f4bcfc6a452c4554f556e20b1115
[2/2] mtd: rawnand: arasan: drop manual GPIO CS release
      commit: a61cb2eba21b897cb5ea2ea46701fcb5b7654ad8

Patche(s) should be available on mtd/linux.git and will be
part of the next PR (provided that no robot complains by then).

Kind regards,
Miquèl

