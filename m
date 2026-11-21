Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795301322;
	b=0G/sNfTNpmi7JU7fTNrqdaIp6ZTARMe4prx5BDUxIVPwgFZnbvOYKkMcgLHb2COLefv0
	 s9uyqdrD26F1gFBbcKdXMOdBb9E5xAMbpginrgvHEx95YYsoPMwkHo7IEwg4xXM0PlalX
	 sy7Z6jkF6cHRMPCpgk7jWtxCKYS1kk00oH7pTXtyVX/p9wpbFmL/BBXciNrPQw7m9s2Oo
	 lnW22QyT798ex/fus76hQ9Q5oA0d1BBkrX5KjdYD7AsIb7wgWQtdVT9CnvZnYGkogv9Wc
	 EgvvfgZew3o3Kohc+mxN+6RDDVZh7Ebam1uHoyla/hvkp+qnQkQ1eZhXxLldSQbhUVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795301322;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:In-Reply-To:
	 References:Date:Message-ID:MIME-Version:Content-Type;
	bh=UqOl4zlghOJCf9rPCZgGU1kaNy09JP0ML7EtvF33HpI=;
	b=XNqUsl4ieMGUGUlk8gLEjumOgfjPmg0ArNjmLseVDzVd1i6ILl73zOpT235Xz/CSREEd
	 iaJtyNkU6SOX20AB+3hP6bKqJspFswywdLU8Bax4403SkkSf98U/+l97924R6yZqe60ij
	 XlurNLY4pWt7o9ytQGtcm7wyi0kDw2s3OoluW4bvsBZrm8hs7cUgu0hMiUYHbmLfUzKtj
	 9vSiP+Ts39fZekgUhHwu+ipHmOL3qPqs9OYyT6h2onyjLxtMH303yxqTSVtPejmayB70M
	 9YVDPcrNUG9J03wyFbsClANlm/JDKGJVUEbaL4ez7Pr8cLItxOceVoMXh47l4B2QRzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ipvych.com;
	spf=pass smtp.mailfrom=ipvych.com;
	dkim=pass header.d=ipvych.com header.i=@ipvych.com header.a=rsa-sha256 header.s=key1 header.b=pJYAfdrU;
	arc=none smtp.remote-ip=91.218.175.170
Received: from mta0.migadu.com (out-170.mta0.migadu.com [91.218.175.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12711606A32A
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 22:48:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12711606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ipvych.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ipvych.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ipvych.com header.i=@ipvych.com header.a=rsa-sha256 header.s=key1 header.b=pJYAfdrU
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=UqOl4zlghOJCf9rPCZgGU1kaNy09JP0ML7EtvF33HpI=;
 c=simple/simple; d=ipvych.com;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795301319; v=1; x=1795906119;
 b=pJYAfdrUVxnuXmiMGU1MQBM0XfjFNkOyzwzWP+m90A0lAOZxmM5lAn0ytfJprAXhQcnzGQQW
 q8kpxaeMb1ZjEMlLQOmJtbl1Y6m4nB7ezQB31t7pfF7nFgTJ5pphqeYbf51Sz8zXsUUR3OuFQAS
 FD6gb6AkIebvbfTCinp0uhCkI+NbYIHnnGaqW3hyFE0smz/Ls3vjr+H0HpBsDZSPIdvyhGtDa08
 FnKZ0BLEEHqEJr3OwSTPNBUSkD+pV3ztX/AUm8/uHVlvIeBUYh8ZlkxH+yHIUeDz2Nq1/nCdO+K
 mjQ2aGHxo8gxerwnLXcwW0ZsibZcykIRkFYGdHC1Zs7ow==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id c9da7a7e6ee472f0;
	Sat, 21 Nov 2026 22:48:39 +0000
X-Mizu-Trace-ID: c9da7a7e6ee472f0
X-Migadu-Flow: FLOW_OUT
From: Ivan Popovych <ivan@ipvych.com>
To: Armin Wolf <W_Armin@gmx.de>, linux-kernel@vger.kernel.org
Cc: pali@kernel.org, linux@roeck-us.net, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] hwmon: (dell-smm) Add Dell XPS 15 9550 to fan control
 whitelist
In-Reply-To: <79f7bfaa-1cd0-4d44-818a-f080cf0168c5@gmx.de>
References: <20261121193227.9408-1-ivan@ipvych.com>
 <79f7bfaa-1cd0-4d44-818a-f080cf0168c5@gmx.de>
Date: Sun, 22 Nov 2026 00:48:33 +0200
Message-ID: <87v75paji6.fsf@ipvych.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

Armin Wolf <W_Armin@gmx.de> writes:

>
> Hi,
>
> can you check if the 30a3/31a3 pair also works?
>

Hello. Tried 30a3/31a3 and it works too. I submitted 34a3/35a3 because
this was what is used by dell-bios-fan-control[1] tool that I use to
disable fan speed control right now.

[1] https://github.com/TomFreudenberg/dell-bios-fan-control
