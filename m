Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.199.235.221
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795451665;
	b=zKkrunLvoNdNEfBNWI+hodNwUoi+b2RoBxIQj8JrdjMZPCqO77JdkerXeTS/0U7aHpe3
	 tC/X9OI1abwrbMZvmqTdKzogwPI9VD1Up/8WhJ2LzZ9dwgSY/3QqDE8Rcg9s3PHvaWlrm
	 wKbIEevlSv0xPH33TbQjem+myqpW+UuqQi20DyUYnLswLXO7ivy9r/lCU8dG7UG/sA5vR
	 Y+dS66FOXbxiJXjd9xqGJP6fYaKZW/S60M/79TwDsbQX/R4CkH2z19elIiDETyHeSdZLA
	 zm8qN31wQYijJObHqW5HG0lFkIBQ2eZKw+XyJbeCuX/zOcpOoT1OoRD4HXzzIKbB7fQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795451665;
	h=DMARC-Filter:Received:Received:DKIM-Filter:DKIM-Signature:
	 X-Virus-Scanned:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=I+soC5Sh4FDvmwplNPuiEd1GOV3Guew6WDJ4B6BfHZM=;
	b=Pcybj7zPrIwQQvdQIEWwy+P3UYQlgrNZ7i3Naf9uQHbSlFRvTNvmm0CFVkNMYau4ZhuC
	 tI6FSrno4xxQULqT+Kf1GwsTu6PLX+8TqxETwh3cUoZ9Hdx2svGVzH+s/kXCy2q7cZZ2T
	 Sra0+9UZ/Eb3B1g74gvvv0607hC85znsaT7/fzyAXMlFCdMnO+WqImlb1F268wW9OQuwa
	 14Eo26kWFjL0zMVy7xINFAHU2I4az1iP1W1kawO+lBt8xNJuk/g0wVgTIfoMbh80Znho0
	 mywFOPFioP5f8rz91QClkM4CQKDqHIyjbOHtimPi/tJNQW4lN7Q9iQgv3Xv+oFidDHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cirad.fr;
	spf=pass smtp.mailfrom=cirad.fr;
	dkim=pass header.d=cirad.fr header.i=@cirad.fr header.a=rsa-sha256 header.s=573E3878-7916-11F1-BF4B-F68474317960 header.b=dKbnz78y;
	arc=none smtp.remote-ip=194.199.235.221
Received: from retz.cirad.fr (retz.cirad.fr [194.199.235.221])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B44606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 16:34:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1B44606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cirad.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cirad.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirad.fr header.i=@cirad.fr header.a=rsa-sha256 header.s=573E3878-7916-11F1-BF4B-F68474317960 header.b=dKbnz78y
Received: from retz.cirad.fr (localhost [127.0.0.1])
	by retz.cirad.fr (Postfix) with ESMTPS id 88C5820DDAF9;
	Mon, 23 Nov 2026 17:34:22 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by retz.cirad.fr (Postfix) with ESMTP id 5E73620DB5E5;
	Mon, 23 Nov 2026 17:34:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 retz.cirad.fr 5E73620DB5E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirad.fr;
	s=573E3878-7916-11F1-BF4B-F68474317960; t=1795451662;
	bh=I+soC5Sh4FDvmwplNPuiEd1GOV3Guew6WDJ4B6BfHZM=;
	h=From:To:Date:Message-ID:MIME-Version;
	b=dKbnz78yoqvRnJtdRC6VnQGZFp4fLkUPCTeZwhSn7Gzk3++14gZaDXk7d0Eu64XEy
	 2G9ClYxt8cZGjf8B2i4W2Tb5SenN0et7NeJVWmmeyx7BgeuqnH4t2fBSPUA6SR80et
	 Hdwd5tWuNKFZtO2sZu9o/K0f4K2P+lskWIGbHetv0dyy5xrHHvh0umwUO7ASgLFgDi
	 xe8l6crslTdOUk1SRgPttKu9XeBYtrTsBtPd4bvSSWqshubPcxY2lIYONNZoENdYwH
	 cneHSRjSbbZHmc5tBAUM8zaKwQc6KZKM6rF76BxNQ8eDwGwbeVo1LCTgUZq02TRrfE
	 Fh7QjJH8eK0QQ==
X-Virus-Scanned: amavis at retz.cirad.fr
Received: from retz.cirad.fr ([127.0.0.1])
 by localhost (retz.cirad.fr [127.0.0.1]) (amavis, port 10026) with ESMTP
 id JEK5IDNvoGaF; Mon, 23 Nov 2026 17:34:22 +0100 (CET)
Received: from localhost.localdomain (78-196-243-100.subs.proxad.net [78.196.243.100])
	by retz.cirad.fr (Postfix) with ESMTPSA id 709D720DDAF9;
	Mon, 23 Nov 2026 17:34:21 +0100 (CET)
From: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Mah=C3=A9?= <frederic.mahe@cirad.fr>
To: "David R . Hedges" <linuxdev844@thelittleman.net>
Cc: lyude@redhat.com,
	dakr@kernel.org,
	me@dakr.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	jani.nikula@intel.com,
	bskeggs@nvidia.com,
	dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Mah=C3=A9?= <frederic.mahe@cirad.fr>
Subject: Re: [PATCH 0/5] drm/nouveau: recover DP links the sink drops after waking
Date: Mon, 23 Nov 2026 17:34:05 +0100
Message-ID: <20261123163407.637423-1-frederic.mahe@cirad.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261103-nouveau-dp-relink-v1-0-7ee88c7f1e8a@thelittleman.net>
References: <20261103-nouveau-dp-relink-v1-0-7ee88c7f1e8a@thelittleman.net>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi David,

You mentioned that GPUs without GSP-RM were not tested. I ran parts of
this series, together with "GSP DP control call fixes and two KMS fixes",
on a Quadro 600 (GF108, DP 1.1, 4 x 2.7 Gbit/s) with a 4K DP 1.2 monitor,
on Ubuntu's 7.0 kernel (nouveau built out of tree; one context line in
nouveau_connector_destroy() of 2/5 needed adjusting for 7.0).

Without your series, both of the following crash the kernel with a
divide error in nv50_disp_super_2_2_dp() (see my patch "don't divide by
zero when the DP link is not trained"). With it:

- 3840x2160@60 set as a user mode with SETCRTC: -EINVAL from atomic
  check ("mode needs 1199813 kB/s, link carries 1080000 kB/s"), no crash;
- monitor asleep (not answering AUX), connector forced on, 1024x768 set
  with SETCRTC: -EINVAL, no crash;
- 1024x768 with the monitor awake, and DPMS off/on (5 s and 150 s):
  link trained at 4 x 2.7 Gbit/s, no warnings.

Not tested: the DPMS-on path of patch 2 (this monitor keeps answering
AUX during DPMS off), the IRQ_HPD and replug restarts of patches 4 and 5,
suspend/resume and MST.

For the parts above:
Tested-by: Fr=C3=A9d=C3=A9ric Mah=C3=A9 <frederic.mahe@cirad.fr> # Quadro=
 600 (GF108, no GSP-RM)

As said in my other thread, your patch 1/5 makes my "reject DP modes that
don't fit the link" unnecessary.

Testing done with the help of Claude (AI assistant).

Fr=C3=A9d=C3=A9ric
