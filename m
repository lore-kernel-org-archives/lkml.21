Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795091849;
	b=LpVqGAF2aG/TWfs0eizFcSsdQkq7N+YrHAoeLDGWRZQAjjrekZC8EEVHmW40fWPrJQDP
	 IOfM/ubxYgsftCsXNzxbtQC3hb6mkyMDloV2sGmzGeUxuEsCShiRseQ4ONObgxV2R2NvS
	 gI7znVUgaGCkdmmfwREB4TFFtOOVLo7m16+sk2exhSF2lpF8wtbi3HZbPJQeDRVIR6m0E
	 +TTnPbgnP0zXCiAFCT9czn5EpxQio+5lbtbVUafh5DF5v9rgfYSU/C37P4ubzJcbwIYe8
	 WGYnqZbvbptj4/zpHcSU4iMSu8Rb4Q4w1zbQdXTBcNoRTs70HSJM0Zr+cLyU/q7wKVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795091849;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 In-Reply-To:References:Subject:Message-Id:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=wMTVp4RCbnjnn/8YS/U7H/wC9SRIjlDLdXyhSR363UM=;
	b=Pt49a8aETNeBEm93DV8jP2eOe3mZQ2bMeiD10XCZfxSFiKXyYmCsl9YDfcGXcmZFULBJ
	 4ioUgbdN3M869IxzEjXVSU0DiGPnjVufQ9yRN6l6EZR3T4DWhr/x38CMeXCiRdrDo5R8D
	 MsmSY8HcIyjWye6OEdIj8EDlCrJOuAJlznLjfZ+77DOsZyg3WhJ4Y3Roe/QPyzREeC88z
	 P6o+5SA2Y1jmGNv2ZAJqzJvXy+SfHZl/lb5QcjWEzX+x67H4SpzjHIrZeLKfegw3DNFx1
	 /n+5ntCQREk+mjfGt2sTakbVgbp31XoRqhSsxkAwYBEmee9KG43Tpd0SfswK6RTlymQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=V4ram5fM;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F95B606A325
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 12:37:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F95B606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=V4ram5fM
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id C89FD1A1710;
	Thu, 19 Nov 2026 12:37:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9D84060237;
	Thu, 19 Nov 2026 12:37:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C375411BC05F4;
	Thu, 19 Nov 2026 13:37:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795091847; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=wMTVp4RCbnjnn/8YS/U7H/wC9SRIjlDLdXyhSR363UM=;
	b=V4ram5fMUuigIRc3Fs8dsN0ybdczSmRqhfkdgfqlHEPeg7TSF//X/uH5t7dPbwBggZQeX2
	0CmE3bSrUlaalqTRKR0dAK8DXwyq+LwL2lNBZ18qXHnmpltH7CDFFvngjS1mxtvWydzMka
	nIZ+5QuND2VWRvKDy/tJkKtpQ1tyVaWg3NhH5oMRMXkTPo4DV/WLJdmJjrtXxYLCATbMGS
	YwDkwg+rL9bgOJk8LFRBNFXb6CO47bZSVO3wUNf0mDgrJdIYsyEuV531I4aA9Bs0RWAiby
	wuy5v+HOQ7GL9ItYhwaViWGzEuGmEmXBwFdegjrrazef94YDU19MrsOdBdU9uw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Thomas Gleixner <tglx@kernel.org>, 
 "Artem B. Bityuckiy" <dedekind@infradead.org>, 
 James Hilliard <james.hilliard1@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261118-submit-rawnand-bbt-scan-error-v1-v2-1-c7b71dd22ad6@gmail.com>
References: <20261118-submit-rawnand-bbt-scan-error-v1-v2-1-c7b71dd22ad6@gmail.com>
Subject: Re: [PATCH v2] mtd: rawnand: abort BBT creation on scan failure
Message-Id: <179509184572.2889394.2633668875586837291.b4-ty@bootlin.com>
Date: Thu, 19 Nov 2026 13:37:25 +0100
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

On Wed, 18 Nov 2026 10:37:28 -0700, James Hilliard wrote:
> A non-ECC error reading a factory bad block marker from OOB stops the
> scan. check_create() ignores the error and can write the partial table
> to flash as both the primary and the mirror. Both copies then list
> unscanned factory-bad blocks as good.
> 
> Return the scan error before setting the table versions or writing
> either copy.
> 
> [...]

Applied to nand/next, thanks!

[1/1] mtd: rawnand: abort BBT creation on scan failure
      commit: 27c61c520e9444d0b16cd8e10c13d8b67f80adee

Patche(s) should be available on mtd/linux.git and will be
part of the next PR (provided that no robot complains by then).

Kind regards,
Miquèl

