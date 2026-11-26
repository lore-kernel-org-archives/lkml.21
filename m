Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795709653;
	b=l4t+s657AOwEPI4Vx2zptRHFStBVWCQ6CiuSWNs3PpsEC+npKgOPYJ8E3sIG/MlGTt+H
	 gN6VBm2aPcvAgsPry+Qk26bAf+SWwGA4EXxehcWUrP5JJVtZTylC5+kVeXxd6juQmoy7z
	 OZQTZ9WVX7RpfSwV4HwmhhLUQgCBTGK3P2THkKF+13duq30ln7SVlcZbTAxjuOfwbBova
	 ssM5RlUWO+fH5gFVG5G+QBfruHlTEsWxASxwea3BMLfYUyFFQg4jEgFUHCNrwPUTUDkuP
	 DlbIZBdZdRHtcu0+pzlWukhq7iELcTzWjI2hn0kPmzuhmABpF0IlJYTxW2/l1Q2yA0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795709653;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Subject:From:
	 Reply-To:To:Cc:Date:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:User-Agent:MIME-Version:X-MBO-RS-ID:
	 X-MBO-RS-META;
	bh=CeZKJVNOA1Gdn53UTRL4wDgsMMGuaOIzj9d0ay6pXt0=;
	b=KYHHl0HSpk/ZomZEA0msorxmF95/DZ+EB9x5HgncB6jbD2rWSy0hHdl8Zs7UrmJEsu8y
	 pfDNMekuHAFuf/9CbjvpZ6IGMa/vmoA1Yk3jg7fZj+SpQmtpxAs8fVQY+Ds4yB3xWncwJ
	 iknQRAZNnhagtFZ+zfklkJ8Z3F41SRjyTkWfIB1RAehppspRtQGA0qOjctvMoSC1KOZp+
	 hMDS7r4XaTe+IXES52yIleq8VegspnDiCWIwJT/EFN25gL7rmJiH66p2eW0+uebriJPCY
	 1vLGWhD5cv2Lx9WgA9LrXjc2hXt0+gqPnYZpckxrFYUmshcdddWNKmvrn6hHcvsG2fQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mailbox.org;
	spf=pass smtp.mailfrom=mailbox.org;
	dkim=pass header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=ALdBvSqu;
	arc=none smtp.remote-ip=80.241.56.172
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0548E606A32A
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 16:14:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0548E606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=ALdBvSqu
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4jb1ns35trzMlw0;
	Thu, 26 Nov 2026 17:14:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1795709649; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CeZKJVNOA1Gdn53UTRL4wDgsMMGuaOIzj9d0ay6pXt0=;
	b=ALdBvSquWbIkBQxrS1wraDsXHO/nUcShnDA/8WlJIMECZHDqi3XOhOx5R8BGLEsnloQ/2J
	VeaIVDftV1uLqi+kBM36LBFyoLmxM83BCU1NQMPowN+T1bFkIp9uTfTqgzE+fL1lQeK5hc
	5QBhC24QnI17Siz2N+S+MuKWwBtMcLttLZPeNm3X824F+noB8lha7ukNuOlOj8LnxmmZE7
	kOEWDIsCSMIGLvWA84kINpcKAtoLU1E1ehR+LeFyiPfw3DI1gABOJDu24k464tOt/6nO7u
	S3b4UNqMvg7PvQBy8gmbQbKFyDm27tUSL0jL4Mwcb8HEMwq1zzkkAoABzYP/+Q==
Message-ID: <5922ac007b35e54e8b0c60a04cc55fb7fc88d72e.camel@mailbox.org>
Subject: Re: [PATCH] drm/sched: Extend locking in
 drm_sched_entity_select_rq()
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Philipp Stanner <phasta@kernel.org>, Matthew Brost
 <matthew.brost@intel.com>,  Danilo Krummrich	 <dakr@kernel.org>, Christian
 =?ISO-8859-1?Q?K=F6nig?=	 <ckoenig.leichtzumerken@gmail.com>, Maarten
 Lankhorst	 <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>,  Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Tvrtko Ursulin
 <tvrtko.ursulin@igalia.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Date: Thu, 26 Nov 2026 17:14:07 +0100
In-Reply-To: <20261117093708.647488-2-phasta@kernel.org>
References: <20261117093708.647488-2-phasta@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-3.fc44) 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MBO-RS-ID: 1f26d367046d2c5b33e
X-MBO-RS-META: ntm65iocu3rg66hh8k9mzkzmmegyera1

On Tue, 2026-11-17 at 10:37 +0100, Philipp Stanner wrote:
> drm_sched_entity_select_rq() evaluates entity->sched_list locklessly,
> which is elsewhere always lock-protected. Another lockless check regards
> spsc_queue_count(). spsc_queue is evaluated under lock protection at
> many places already and the plan is to replace it with fully locked
> infrastructure anyways.
>=20
> Move the spin_lock() in drm_sched_entity_select_rq() upwards.

Tvrtko, Christian, objections with merging that for now?

P.
