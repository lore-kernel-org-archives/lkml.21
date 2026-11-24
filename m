Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795532830;
	b=KCcQeJ7IjFxQzhvDqTfvvq3qwVFVPKI5Pr/VW0sHq2NyZOWMsdhPqYdlPD+G87cJQodY
	 3w+E48ua9P+79SPQURwrYo3ycrji3UJoz/vl27mh3VRULkJSFXNUSwVjNpPPyjnc4/3ji
	 YyUTS8eSx4wjB9cwMNF36MRbmx9b+VD9hdMM5ck4ZLy+TUF1caSQWCnkJ6HWcEGndxBAc
	 7L5Bid7eBSCQyugqBOBNI31Yl+XPmlE8LJkOUbNteXcTNDhCdjMyL71BdLlt5Ne3Vl/6F
	 2J5bQGYriaD208P37bYJSUlj3PYZHAqB0pvTEGfvn2d7WzgBePnHV+1ZCYSc7QsAf5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795532830;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=yKYud9p8+aP8cT7V12zkUbmCop1ErkdHEczU+hWaU/k=;
	b=eE5Nq/9J8vy77BYo8xh+1IjfTaKqRU9ZjRZVUmptq1qMvbvWRKE3c8QiQTtw2A0xfHDf
	 y9R8WN70/YMiTZK8F2kXhOgbc+PgAyZLVav5Yv8HDR80YzfqltxcXGa6Pq5CYhFblT1gP
	 xRoviHRFosE+Q1AgIA8ZViQpXcJuZd9YgUDObYb4s1/vRq3uZ5lbPEbDNNh6Svb8P3ScY
	 oR7YHpdcuS8VnSPic0hOs/KEziHt2lsMI2tGo6pijy134tIEiKINoe0bF3/BHU+rbD9Jc
	 3COC6kftDkREufAj0GvNZfB54WSQaY5erKH+VAJVd+toK84ve4vl0/TIgapbefNHzbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oawMuID1;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFB7A606A327
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 15:07:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFB7A606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oawMuID1
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-385d8a00598so6726623eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 07:07:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795532829; x=1796137629; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yKYud9p8+aP8cT7V12zkUbmCop1ErkdHEczU+hWaU/k=;
        b=oawMuID1kmubn1t/+T9ikxrmuyO8SiZvLdSJSiJJWC8ReJcm8QQEaWbpd+RAneNGJZ
         ww/4FL/wELbrzZGcT6Z4sAsw2+jOD+0ttcefX5O4oUswHlPzUwE1rd0gAQ/OYw3B4YDV
         B+em+gKTenae4nT8LPVOGApHKbaLRaWw36qhmR3ESIqK6o9O8SEHHP/Yupi4XedNBHjN
         ey5a77U0fmpS30cY9ohvSier1nFLxTDc3DofBfh/M0rIUHLqZLPPOpC17s95AsGchZp2
         43TArlHgH8AUIF8/XHsDI4N3oApa0Qe0vjJlbiFMxFARgrm0T7y5pfnVWqzAdpoUUlPs
         pfQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795532829; x=1796137629;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yKYud9p8+aP8cT7V12zkUbmCop1ErkdHEczU+hWaU/k=;
        b=aAXt6tBrtBrhrxgXts3tTzaexRn4+E9QeHU3vEPz/4z2knqPWf4CtXWehzIuh7yKSZ
         32ZMXCoNnT5HuhAq/hVBsusKxLGq8xhlEYTs52RcZYryRF5x4HGI+ZNPy2C0VOYvHWQo
         VM1eqEd+5ezxF1VAFY7tITr5Y/rsxtP87URsvX3LikJ1x7BnrEpKEpw69r5P085nm02D
         LPJfxx7G2t3ZpdXEhNHges4q1imiFpawGyBNVwxN8bxk3Vwl6dLOQEdrbHo6qhJzbNd/
         kayTE+6sn3ArQnwQhaSevEq+GPwIi8SFxdRhTY/cNejTVfRQPnK4p4/ZTGffpp1qid2J
         ZPug==
X-Gm-Message-State: APuU4Z+T1toQgyby90LdxVGMV646HfOw3bZhIE0ZKNtERE4g/V7QmsgD
	NVTAcMYTsLDhddmu3Cydbgk0tB3Ks6vgb7p9GRTIs31ConA002W8Nds0
X-Gm-Gg: AZFdTZcM4Y6hf8JlJcf8DxD8w/YH/JfE5/YZ9+B4YxclF8sWmULsGp9eaRjdlrjaodp
	cDhpJkt64oHF0HlDsVuuwYZYgPZwWkmlLX+dcNRjTr4HSZlckbU93Klobu/6s/f3skmNKJNVA/E
	5xBCvrFcayDfW0QFeLVpbH5RyvQiTyt9FVlmUI0ZCkseJbEuXWwmqOfv9eonU/ESuBanrKdi/d7
	e+CZOqcP9lAedt0T8E3/cV1L4O9BlvcKxTaIzMcNUuJpAdC3I0mLOCY+K+/ZMTBl0fwXI3TM1wl
	XdvH6VyYfeurmPrpjrHwjQNhPVuuhd/RCtPrKluLCUBrFUsCuM3x38HJjX4gq+LUmS4JlYlaQ+T
	hxoSA8Nck7lIxUB2vP7ktQqwCT+dC3mBO386bO7GkOUbrO2hmbpOj2JZl4tnNtxNzs4WzhZkZTm
	1Xh19t2rEzDHWfWUWbJ/6xGKs4tpVfCiuvpSkOqDf0eQVX8K1alnA/bb6+NvjbKoZPZeoKNmrD9
	MY6zw84nrn0yMWE9v6KP6tBt4QUiEYx7mQiwBOypYxwtZKXtzKSKmTAGH/T7yNU26rvHnyiBD6R
	vKc073f9/9tT16nXmz6difyM1EkYFDcjzPLTSCj/nondslEd1lV+
X-Received: by 2002:a05:7301:4704:b0:383:729:cabe with SMTP id 5a478bee46e88-3856f8519ecmr16303982eec.19.1795532828449;
        Tue, 24 Nov 2026 07:07:08 -0800 (PST)
Received: from localhost.localdomain ([103.178.205.105])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386b9bdafb5sm12728260eec.9.2026.11.24.07.07.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 07:07:08 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: tiwai@suse.de
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	sreekuttan2156239@gmail.com
Subject: Re: [PATCH] sound: core: Check return value of device_create()
Date: Tue, 24 Nov 2026 15:06:41 +0000
Message-ID: <20261124150641.2650-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <87qzga9ytd.wl-tiwai@suse.de>
References: <87qzga9ytd.wl-tiwai@suse.de>
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

Hi,

Thanks for applying the patch!

Best regards,
Sreeraj
