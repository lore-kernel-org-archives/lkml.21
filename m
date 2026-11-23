Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795394761;
	b=1glR7g33O+tlG7/zPC/PAjxT4BQ1onIh0/bhUtz6dzuqntgH+0Z7Dz02kSHOkpQuRhMh
	 zX8jR5VPzYxCz4YswNtpA/3ZA1AC0aLJiWgeCLkOUgjdUwyxgkkZ8h09hvEhTVfYR+GIQ
	 WdF1IyJlTHnQAqtYi7MdrQQMQSwGz5A8BqaU8UnO15O9h9+Qazu5DutSf5LveOBhkngto
	 BIHvrrkhyJQ5h0XkJSNQt2sjd3d36G52OC+y9QeBtUofkUkA9jVfAjg9I74G4Zs7oy7Bf
	 3owvII6oKwPuwtbB62ITKAwN2EZE2jfQLT53YrfbRvySjEOkV+QHhrx810vFBdsx7ow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795394761;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:To:Cc:Subject:From:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=TlGQ+s1w0re2RtxBjjhAHjiKtshlusVceD/sHg+v24E=;
	b=4XuMY9TADg7vn89fgR2cMoCZMk2vBbvuhyKDVUaIVkAHRQjOhFqklGPmj4wGVYbL8qyw
	 tHvBjCCYB2pE8RizKje/DuvWoBrTurDdjUyo/cJn/GFNHS56L+Qch1B8v7yEhN3Tiu9kV
	 OkbyT3NQMy+zne6Th20TD8bkM3mS4owctgYGjfdMbES+5LGi7+3kGtK43AM6e6t3g6Nxf
	 jA+IJVm4AGyFDReqG0BH1JwoATtNK+1fF7+fNfQuPf6l7YS+cRfdsKJhIdK93/wzeXwfQ
	 HXnzI3ozwBLo+z/b8Q2UdQSX9bTpOGpMyxqP9pXpUtWS5q1F3Dajo6OPMeyTYg8RWzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xjQNwyU6;
	arc=none smtp.remote-ip=209.85.214.169
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5398E606A320
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 00:46:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5398E606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xjQNwyU6
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2f05bc71e01so9117705ad.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 16:46:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795394761; x=1795999561; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:from
         :subject:cc:to:message-id:date:content-type:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TlGQ+s1w0re2RtxBjjhAHjiKtshlusVceD/sHg+v24E=;
        b=xjQNwyU6MYR+Sv9DqBxkCsB1ojg0HIKyMipAx4s6KRT5IYdJvl+GnVSxTRanDwlO4b
         OjsHRhZlksxkgGyYo9uQR4xnsH9smwEzvZB0U0xWIc7WLxA20JEVyHvBNfOB3Q6RKyJl
         W3Omp6JWwiCVAkQ9a9ECTstSvDMsiW2opPGebxfCTT5SlPd+dIB1fYQxZJhDwkFAzhym
         zUVWh9jYqyhJ1lPaR/5BHmGuhw1iLZ2Ep7uY5F2lH9rP296aefHI8qNbvrd9S8rKbf0P
         oiX4dY0ljie0g+etEjHvsK3G0VGKqx3XN4ZOcK3unI0mprBibWrDrY0Vx0uR0JHB3rXt
         eoGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795394761; x=1795999561;
        h=mime-version:content-transfer-encoding:references:in-reply-to:from
         :subject:cc:to:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TlGQ+s1w0re2RtxBjjhAHjiKtshlusVceD/sHg+v24E=;
        b=j3NP8NfQNNYEMufQDb5V4NisbF8zIG483jVjcJ7f3LxDkXVK0koPpM3UGoaN6/DWuu
         MmbxMebOjs/8ipvJ7XrJfd9VnhJrh2c7Ay4TYHlYxhvVTNDeWch5fWnYFQ3qYCVzRB3k
         Gvyj/VFdcwtI59jrt9lMv1xU7GfQhcy06uXH/v3Oz4xkm2TwHglR+kllubjiB/MwjmDd
         vmphvqXUwIGG0D2WFj0InsuXUtf37dGZHr8Dc2dmjk/0o656DZI1hupUvu+YGzqF2Npf
         u12uVOk96fkdYG/noIqpCSDyquNIn+n5A6AO2lCJ3tDlgudVuZnJLuv8dX3zfulv6r6N
         nMSA==
X-Forwarded-Encrypted: i=1; AL+hErHxCB/xeAXGEzZC8Hrg1iSR8lac3FekrD3sCiJDAyVu+7ireLmQuHzoyJqDBhdjUixlmN8YAXqSDGpSl9E=@vger.kernel.org
X-Gm-Message-State: APuU4Z8RLmmlbJ8jlATaOkAO/YC/n0xj14WjqLMWaHEdzaA2RLryLWX7
	oBely8HCqfI6x5/yKJ+ybElVBDmP0bbQGd5pCMu7VMfYNuQjI3vdLkz4
X-Gm-Gg: AZFdTZcALZwf8P/eICSsR84PCOSsD/182CGhH9MCZEaO8KibouCQzxp6KSysykhxF2K
	YWtIpZNkGiJLe0gnJZ4PWszSwd0f1aCMe2Bq2Q58OoJGCW+amjWaYU39Pi0KdXQNO6IWzSJiXze
	JLQWTurvMsWtIinPMSk6RwyuRXk9ooLfrZ5yaficq0SYCajDAsekg69Vr21EFPhc2hX8V5ZuB8E
	KlJEFOz5PuU6eVPYkeIiXNMFqQDtqt4NRNPNm0s+nICjMFHJVFMOuJxat3WllG9Lhro7kTdEmq8
	CbMLoraqWvLsomNkFcAfaeNiP1iXurfZ9oX2kLqHSKMT9atQdDzrvfZ/y8xct50QSf4InHPEtnQ
	/aqjSHGJxr/JC051anzWh23iFMJsrDKYaMccT2wGO+4aHpOls60Cr2nNR/erPvo72eV1/GCxpUB
	+iLC0M0xbgalEMtkgJeuZpMWDj2GyMBUOSWYVLm1ITYC1zmoy7J0OpRqz3Z3rihTiJq71BcgY2h
	ddomSvti0kNBkTcu6sMM69cu9edbne/P0fw4NK0hWhwWohuL9mCZarC8XA8IkDGqNY3ySF2rWcy
	lR3kca/bwZFiRPLfsB2u53K7pOA16ShymMJTWKRKoyUVmvwyOInh5kESspW7R2F7393RHeix8BD
	UZ5lChhO3dwu3xTzoeVDBUhAXnRVbpOeszsE=
X-Received: by 2002:a17:90b:1802:b0:3b1:64d3:f308 with SMTP id 98e67ed59e1d1-3b41c955a0bmr8991155a91.43.1795394760621;
        Sun, 22 Nov 2026 16:46:00 -0800 (PST)
Received: from localhost ([153.61.198.250])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad48786sm15174661a91.9.2026.11.22.16.45.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Nov 2026 16:46:00 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Nov 2026 00:45:59 +0000
Message-Id: <DN26BQ6CGT3J.2WZ83RCCF7HDD@gmail.com>
To: "Jiayuan Chen" <jiayuan.chen@linux.dev>, <bpf@vger.kernel.org>
Cc: "John Fastabend" <john.fastabend@gmail.com>, "Jakub Sitnicki"
 <jakub@cloudflare.com>, "David S. Miller" <davem@davemloft.net>, "Eric
 Dumazet" <edumazet@kernel.org>, "Jakub Kicinski" <kuba@kernel.org>, "Paolo
 Abeni" <pabeni@redhat.com>, "Simon Horman" <horms@kernel.org>, "Kuniyuki
 Iwashima" <kuniyu@google.com>, "Willem de Bruijn" <willemb@google.com>,
 "Neal Cardwell" <ncardwell@google.com>, "Andrii Nakryiko"
 <andrii@kernel.org>, "Eduard Zingerman" <eddyz87@gmail.com>, "Ihor
 Solodrai" <ihor.solodrai@linux.dev>, "Daniel Borkmann"
 <daniel@iogearbox.net>, "Kumar Kartikeya Dwivedi" <memxor@gmail.com>,
 "Martin KaFai Lau" <martin.lau@linux.dev>, "Song Liu" <song@kernel.org>,
 "Yonghong Song" <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>,
 "Emil Tsalapatis" <emil@etsalapatis.com>, "Shuah Khan" <shuah@kernel.org>,
 "Sechang Lim" <rhkrqnwk98@gmail.com>, "Mattia Meleleo"
 <mattia.meleleo@coralogix.com>, "Michal Luczaj" <mhal@rbox.co>,
 <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH bpf 00/11] fix misc sockmap issues
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
In-Reply-To: <20261121103222.88209-1-jiayuan.chen@linux.dev>
References: <20261121103222.88209-1-jiayuan.chen@linux.dev>
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Sat, Nov 21, 2026 at 02:30 AM Jiayuan Chen <jiayuan.chen@linux.dev> wrote:
> This series fixes misc issues in sockmap. Most of them are old.

Jiayuan,
thanks for the follow up,
but the fixes are way too heavy. bots are correct.
The patches introduce more bugs than the fix.
Pls ask your bot to think of absolultely minimal fixes that do not
introduce new states.

pw-bot: cr
