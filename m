Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795186970;
	b=iv/vUA/ZFNsetmWxz6NTrNqZJM1pXqCKKSfyYZbQZKfULZrayhaduFcEZeVMaG76kmIa
	 C/Bj8r0m6MVC3wL8TAnoIupWSihBFVvss+7bORJ69Gf46Ym+mHvrX+Wa82mSclvaD93oq
	 gwJ8f0VYd5/SRuvOLrNgpz3h7V9Mf1H/FgYYDw5ZoLSwWxsuJEKMqHzzStbTh/otVnv+2
	 e5a1xilA0HgZfU2U1gcvCW9cHY/4f95tiuqgifUItGiNButE8uHfk3R04AOnxHt8K0JfI
	 FrXj0mlylltaBa5RWM+2rwMyNEZvkrNehqLZk0DbTuE7bWvbV+B8Y9HRT4WqietJktQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795186970;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 In-Reply-To:References:Subject:Message-Id:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=eCJcsk7nKdE/zS/Mw/SS7quXmWWfDvd3Vyxw1OphYiQ=;
	b=tpDzoldsLW2Z0zmED1qiW3uoZyxze6NlqfGLLMWS9sGYgy+ue+Vozcj9eHv54DIq14G8
	 19zLFrVc78OjKkN/OXOvjZzjylRYFh11a+Lb+NVMq6SSKLQzVU+pjK0Me7FYTKOBpbVzV
	 hN9t2XwwgD3TULxAhhgAGxw7mdeUP8t8nVzwgN7ezsQXmlKNyxvFW+EuCMXhJhRbLj3M5
	 r9/DgHPFl3pD2Ffy+UwGr5jQioHzwBhMJmROhTtyV0k6jO7da7QajJXhPprvoVl2Wb0HN
	 +mQud5tPeSQprE3eUQ3MzGGSw34v62Zkg0vNCuzYB8Mab0XtS4yldHOyNtr9PI+3LGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=mvfJrJIS;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2320E606BC81
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 15:02:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2320E606BC81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=mvfJrJIS
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 3F67AC6221F;
	Fri, 20 Nov 2026 15:02:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 805B3601B9;
	Fri, 20 Nov 2026 15:02:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8BE4911BC027B;
	Fri, 20 Nov 2026 16:02:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795186968; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=eCJcsk7nKdE/zS/Mw/SS7quXmWWfDvd3Vyxw1OphYiQ=;
	b=mvfJrJISZSYm07vBBw4iF43fWAabOWg2boVfJFPB39RisD6iY9q30nyj60ph5H2VU7+61h
	thwRC9ePbnMQMJpiVpHJh6nQ0ErljTqNrd2pcRtLNqKpkk7PX+P54naI3d7g0tVJJRHtVy
	SShzP6sO9qRyKPaRYF7ZUTnB+q+ZuioWAZ8u8An7Zy/p+Koa+b2f4K73xKi/3PpqfMelXX
	+zrLPyJT/5bZipyIGRyw2s1JlzIv3oXheujAnfk4Gtt4kyWjjwrcpSk3qct7c44AO/Frk0
	de8xJXkYe8Bcd5xbhdUkZm43vsd+uG57mDOr3WOUhgm1oW3dhhctkiYT1Fv8kA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 James Hilliard <james.hilliard1@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org
In-Reply-To: <20261105-submit-mtd-oob-end-v1-v2-1-734bffdc2914@gmail.com>
References: <20261105-submit-mtd-oob-end-v1-v2-1-734bffdc2914@gmail.com>
Subject: Re: [PATCH v2] mtd: core: reject OOB transfers with no complete
 page remaining
Message-Id: <179518696533.3401781.5807779748202005416.b4-ty@bootlin.com>
Date: Fri, 20 Nov 2026 16:02:45 +0100
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

On Thu, 05 Nov 2026 12:29:40 -0700, James Hilliard wrote:
> mtd_check_oob_ops() permits offs == mtd->size when the data length is
> zero. For an OOB-only request with a nonzero ooboffs, maxooblen then
> underflows because there are no pages remaining. The wrapped value lets
> the request pass the OOB length check.
> 
> The OOB ioctls can reach this case by encoding the OOB offset in the low
> bits of start. On a partition ending before its master device, the
> subsequent address translation allows the request to read or write OOB
> in the page immediately following the partition.
> 
> [...]

Applied to mtd/next, thanks!

[1/1] mtd: core: reject OOB transfers with no complete page remaining
      commit: 656496952b7d3b7a0283351387a2e444df07f6cc

Patche(s) should be available on mtd/linux.git and will be
part of the next PR (provided that no robot complains by then).

Kind regards,
Miquèl

