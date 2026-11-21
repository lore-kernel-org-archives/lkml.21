Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.145
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795234214;
	b=Lvtf/ysEi2ZTrP1gYE2Ip7GJU36J8FXkdlKMNkqzIm/TnvrUel3W4YNd8t5GH5jrmquk
	 Ik6We/wE/Mfu/OB/OO20tAQ19gPoT3LnzWV46g3v6RuPOtfhjIDQryPrWHGnxU6zc1p1x
	 5b0iTwE2foilbYG9vTH18O5MIBTWgibXFgnw9ZuNcdtbEkiWWmxv3t2zT0jizN7HWm3Qj
	 beZziRplWcVuU+U+jKKFe25FlfnJLkzpukDMFwCiz1NrAb4DLCnOEem3JQktCk1PJeKN1
	 bpCC+PO/TxJ5Ks1IgbIyLhFSj6o7I5SjwDf1awwv5+JbHEO6di9b2KldpL4wg0TAhiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795234214;
	h=DMARC-Filter:Received:Received:DKIM-Signature:X-ME-Sender:
	 X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:Date:
	 From:To:cc:Subject:In-Reply-To:Message-ID:References:MIME-Version:
	 Content-Type;
	bh=V/ZfUxjm7VkyBHyByjR7jRTw9kA/DfQjZiBXJ4WYVbw=;
	b=1i1X7dGiiF4TLYWyeCKPKSMOVlBMIcH/t+E+eJ5Bk5GVUQ9ZEdr9zdAIk2v+mthAwQNl
	 Wy9NSSe5enf1Y9klo9EoXtoJJEYgYX81WhN5WptJm3IZzWQSlUf7NF6fsVThGUNCPF81w
	 FNBGFCFyjN9XKB39cfpY3FOjUC5pI6KJ6u9JbajruLdX1S/2dPdBJiQiCg8N6ntV5Hg5V
	 CHqe8cvNmGH/lBK+bPcpMX1i+F7JSfrV4m9XaUhfpMAdQCjvuuY2vFTP6u37pIHJZ7Ayc
	 aqjofduFcAL7IR1+B4ml7WYMnYkv2CiAi1NhXA2xjGEM9s25xZFSamejTCsMl/gbMmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux-m68k.org;
	spf=none smtp.mailfrom=linux-m68k.org;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=x8GICWD4;
	arc=none smtp.remote-ip=103.168.172.145
Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0196606A682
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 04:10:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0196606A682
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=x8GICWD4
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id 85CD8EC0C22;
	Fri, 20 Nov 2026 23:10:12 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Fri, 20 Nov 2026 23:10:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1795234212; x=1795320612; bh=V/ZfUxjm7VkyBHyByjR7jRTw9kA/DfQjZiB
	XJ4WYVbw=; b=x8GICWD4UoDMvXS68x4O4raIRV//lKadGXkbR+0GkMwSLKHNN3a
	l65ZMHAOpoRExR7pAIvihhPjQGT3B+CeCPEqupiPdS+y8m4qWGZ0gFpOiAf3WOyQ
	HXEPJYXyYELOEC6BDLHbodcnTwzVV3AE1F7UpDMoJby54p6nhGHYXquXPb2CJU5w
	jYZKsTebidgw58LYURef+XgVl2Vvo0E0IHKmrSBdHyUYlRxcToqjV9PzNEE2to69
	9SiQnb828hKNRHd/0vTC9yk7rdxaIXohwi80VCCcKKU8Oq7mBsVOUl4cZeajtcfZ
	YTBS3+mVttGKchkvH2ImD7jWE+U1EC5PLLw==
X-ME-Sender: <xms:oxkBa3_mj_f_gnNZhkN3ShMI9QrSQF8vMo8R673cBuK0m2EVP3DZkg>
    <xme:oxkBa9CtXDTbRboHpek_vq2QxNVXphewrT1_3YqsK2S2sYZ8AgrCsexDWypt8KOs7
    An0ZVmTZSlTXZtRd21vXqRaX0sswChd5bVReTsoWaXbyefruZSL1n0>
X-ME-Received: <xmr:oxkBa8Sw1JHyWSpg0ZGJunlZh2DyuYd5kKA4PTgFCfkO4O0XltAeKO-oT8hj89JEMpKCoyr_LD2OfzuTy7M61nZKhGlg1c0YH5A>
X-ME-Proxy-Cause: dmFkZTGD4fLbFmQBkWa7VJDwENrHmzx1MAeeBGv5VgoUdl7GYZCUtedTAG5hE6WZtkUvp2
    jAxj0aDLHn5ZP0N9STxC5xdAbnE0dTF3qbtjthBjKPJ8Xsg3BQKLzjqyD6oP3zVt3yoPRR
    vNfzy4cMdcP814aPPyf/BWEw8HV2TY/g0kehcIDNvbT1J5MpDpxMMSdo3VH7ucRWfBF/Vy
    GZz+6B1N9UgoWYOU6ZK0DviVw9YdJhilwDMtQCMhN4cEAWiNbwHxYR9iyQ6mNgMN85GVZk
    QAOliH/uQm3sqP7RJJsYaZ9dt5fbOXYVQzeMVjmtVn+hF0yO5K3Iw5fCUS41YyOlTc5LBM
    smdKMjYaK+8NATKUP2Xdh1tgnP5RghKgOENnJ3sSyIqkf7N5MrdULnt9MMPtaDzG9OJdqD
    PLjiEE+l19d/S1OL9XToIkbZrI7c0RVSl/g/aoaUewq9zXhvua/NuT3GsZA4XTt0GqxaYI
    9zUxhmWzhxREwooMd8UeI0kW1XmyJ581hXq4X57YbBbQYwuKroBTAvrSkrjXS1IYhGJt8V
    iTPHzuj4vtNYyCyjma9N7uuEFw9teoFZAcOYTJfCx888gRUlxRBZP78R2Ti4PgJTuuWfSQ
    wK4/4NtKUGUCxVqKwprh9irouxF+izv1AN5Am/1bYfPQV3gfEhrtcAcfT2WQ
X-ME-Proxy: <xmx:oxkBa0t6P6pw-Udkc6dfiSa5yNT73qkgqAfAJMkl2BSqo3iIMduBNQ>
    <xmx:oxkBa43qElqcSN6y_5x8IPKnFPpP0M-AtQ2SWPu9L0c76O3bOsE5jA>
    <xmx:oxkBa1WQktdHrofSNid1wbZlxky8UhzYTZBX75sAWpnroo8lYqT0lg>
    <xmx:oxkBazKusyYOQSnaO7tLQPZUNByO6OqtMiJaGRr9nje1FBji1FpzFA>
    <xmx:pBkBa3_ka8wtlkl1H0cTDIoa3OHUpoP06-hjcafN-uO9spnFcy3lYCjQ>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 20 Nov 2026 23:10:09 -0500 (EST)
Date: Sat, 21 Nov 2026 15:10:04 +1100 (AEDT)
From: Finn Thain <fthain@linux-m68k.org>
To: kernel test robot <lkp@intel.com>
cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, 
    Andrew Morton <akpm@linux-foundation.org>, 
    Linux Memory Management List <linux-mm@kvack.org>, 
    Arnd Bergmann <arnd@arndb.de>
Subject: Re: include/linux/compiler_types.h:631:45: error: call to
 '__compiletime_assert_433' declared with attribute error: BUILD_BUG_ON
 failed: offsetof(struct qla_tgt_sess_op, atio) + sizeof(u->atio) !=
 sizeof(*u)
In-Reply-To: <20261121034304.2dPxVKzk-lkp@intel.com>
Message-ID: <0b947a72-7a68-9bde-8b0b-adb539f09a8c@linux-m68k.org>
References: <20261121034304.2dPxVKzk-lkp@intel.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii


On Sat, 21 Nov 2026, kernel test robot wrote:

> FYI, the error/warning still remains.
> 

That's because the qla2xxx maintainers at Marvell did not respond to any 
of the three fixes I sent. I'm not a paying customer so all bets are off.
