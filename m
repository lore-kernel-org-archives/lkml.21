Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795564476;
	b=r/QfR7wxtEbElk/lizwUhEwbPO7NQprss+VPjWXXSmPhghV/3k1JuuQBqpL22KMQvCB7
	 9UK6Gbi1LmUHTjbpJaVen3z8hyLH88SsEJzzQPY5UnzTT2FuC70wJV/TeChYsAWEjqFV7
	 p9YNnDWkuhGdEilZkBiXXazGrj6jkDRHlgoAZuKWBFwHmGAMXc0B1hqZwSMhpC/DRmCnT
	 I+nUoygRqQqoVYidEVCMEhOZu9IlLYc8UW0SM8u+9h3lmNOtqa6fyBbbLbkYZowZ6fpro
	 s5zRTWfGN/8rJiillJ1rGeYsc1EChAYPvO07leMxJZb4k+KhftDoQZEqER+/zbvOSJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795564476;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=QWGvzPpYWLrHjwLeDxSm7nXRTt1ieW4I3yri6RDwek4=;
	b=WvcB++ZTioOryqabPDURG2f7cpyJRWfhqhsyJzP4dPuWdPbFjswIe3GWXL6QTzyA1691
	 5nModgxDuS5bW5/0mT+gQSLZR3rODBJXRYhwYhL0Ibu8WeMDw2ZxpenZem+fKII9G8N3j
	 ESl6dYp+it0ASoJCCw0QojYBNytuPV0SKoBa0lVnuG2DH0Uaw7x5oWPrnImlgW+zZSXHk
	 53Wq9F9EAr5pmLtCc3qrRlbNXo7N2Nmjm8XLPZG/On3ZHPWClsdiSOD2bCx0+ZbUO8lSZ
	 tAXvo+SuGuf9tyw6GqkSRhKQu9AUyg69dWuQABM7nil7LmZju7WQnSp3xL2heB5Lmvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FzgB3qBG;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85906606A338
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 23:54:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85906606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FzgB3qBG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795564474;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QWGvzPpYWLrHjwLeDxSm7nXRTt1ieW4I3yri6RDwek4=;
	b=FzgB3qBGqUGeo8ZwSOCJZOtNyC/CqttQjkyQoFvsuCQ65wZqz2EbsWQTBGJXH6lHOw0vvu
	CH9/AAwUeLUxbSt0LCjYYDFEGHrIn4Y3S5QCZkZWMrxdVOJUv+Z7GkfNY7hJVqOI6YQJlk
	LaQPh6ZrVCSgDfyAHp9qlixQ3ZFt+zU=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-435-NpUdX5X0OVGaDfU1Q91OYg-1; Tue,
 24 Nov 2026 23:54:30 +0000
X-MC-Unique: NpUdX5X0OVGaDfU1Q91OYg-1
X-Mimecast-MFC-AGG-ID: NpUdX5X0OVGaDfU1Q91OYg_1795564469
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 43C4219560B8;
	Tue, 24 Nov 2026 23:54:29 +0000 (UTC)
Received: from jhladky-thinkpadp1gen7.tpbc.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id ACC51195B3C0;
	Tue, 24 Nov 2026 23:54:26 +0000 (UTC)
From: Jirka Hladky <jhladky@redhat.com>
To: dockseed@proton.me
Cc: will@kernel.org,
	catalin.marinas@arm.com,
	kristina.martsenko@arm.com,
	luyang@redhat.com,
	jmario@redhat.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: clear_user: align __arch_clear_user() to 128B for I-cache efficiency
Date: Wed, 25 Nov 2026 00:54:20 +0100
Message-ID: <20261124235420.1299547-1-jhladky@redhat.com>
In-Reply-To: <h2Yz7IeYKGRjKTvtyae9lgHZIlzgU1Ze5lPbucMya5_pi5-E78h2z8BgJHbZ0JG3ufYHoIE_2ax0hUF-_TDkXfXnPwhLilCyFV0NHh4GML4=@proton.me>
References: <h2Yz7IeYKGRjKTvtyae9lgHZIlzgU1Ze5lPbucMya5_pi5-E78h2z8BgJHbZ0JG3ufYHoIE_2ax0hUF-_TDkXfXnPwhLilCyFV0NHh4GML4=@proton.me>
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
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

Hi Norman,

Thank you for the excellent analysis, and for pinpointing that the
root cause is in clear_user.S itself rather than in where the
function lands.

We reproduced your findings on bare-metal Ampere Altra (Neoverse N1,
no FEAT_MOPS) and can confirm them end to end.

Disassembling __arch_clear_user() out of /proc/kcore on the running
kernels, both the ELN 7.3.0-65 and 7.4.0-0.rc3 builds we tested carry
exactly two NOPs between the loop-back branch target and the first
sttr, i.e. the padding you described.

To isolate the change, we built two kernels from the same tree, same
config and toolchain, differing only in the label move (your one-line
fix): the unpatched build has the two NOPs in the loop, the patched
build branches directly to the sttr. Reading 4 GiB from /dev/zero
(performance governor, pinned CPU, median of 3 runs):

                        unpatched     patched
  kernel instr/MiB        797.5k       536.4k
  throughput              11.6 GB/s    22.3 GB/s

The instruction counts match your measurements almost exactly, and
the delta (261.1k per MiB) is precisely the two NOPs at 8 bytes per
iteration (2 x 131072). On N1 the throughput effect is even larger
than on your A76: +92%.

The unpatched rebuild also reproduces the stock ELN kernel's numbers
exactly, so the only variable in the comparison above is the
one-line fix.

I have posted the reworked patch as [PATCH v2] in this thread:

  https://lore.kernel.org/all/20261124233043.1289050-1-jhladky@redhat.com/

with your diagnosis credited in the commit message and a Suggested-by
trailer.

Thanks again,
Jirka

