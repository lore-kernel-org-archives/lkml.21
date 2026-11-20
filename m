Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795207362;
	b=1AG5lBVjOEl8Ea4cHcmA86Clu/y0cwonp/GBZXAu5BpSoCiuwvfPVdbzBDf7TCujMUew
	 LiemyD+rGe0/4AxgzHc5ktS7llsTXzf9oIP8ciHXV5hlU8EDEpN4j69n/wlKRf2UWisXy
	 c1uOuYdv2FZ5e2f/0YSu5giBKC5U9huX5GwNImjcii5shb0FEN7SBZ4MIit4NuZe8ITRS
	 jpN49GzAOcB/mfrOuaknrzrg9K3tbcZxlqHFbTixj0OkuMijGb1gxQrXoky/XAf+o51T2
	 Su6L9Jclh8Gowi7wOsuYwKvjLZBIs4+OHxXvBUta0KmsvupSznSJmvLXO59gredRQyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795207362;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:MIME-Version:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding;
	bh=zvhZlU0ddPN9o2nM/nrK5XTVxzJuCMmPH0NhVRQSvdI=;
	b=di0z7KXvkbtxPhT8etj7cq/CK8WrC8Xw97WPD0rUu1bCHd4DTw8Xjv1fXrNN0x8RsHAh
	 /O2ELyYWtjJwCSHDv6RcfdbKcj/EiRwPDJ5PRgWSxiXh2UvqrIWSzoFf9tMO4XA1UcEyp
	 VDDGdXrBVQvlT7oIpOYsyiuJJ650ND/PVyLxZgWk8RjVp0tIeo4npp2HtXFkXVrIT46zK
	 icuWxaC6XxsRS/CNPQp0orqrXIenTKTyc1dQloyvs5c0ZgDimpXppQdfv0fcE0dbv/5jP
	 yz6QRCL8dnsw1yi6I9tgw+fVI7NI33b6PbuGQcOz3ZJ441ddtevIDmdnsXuIfip/GkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=kernel.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.160.175
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F1C460A261A
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 20:42:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F1C460A261A
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-55c5b6584ceso10065071cf.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 12:42:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795207360; x=1795812160;
        h=content-transfer-encoding:content-type:references:in-reply-to
         :mime-version:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zvhZlU0ddPN9o2nM/nrK5XTVxzJuCMmPH0NhVRQSvdI=;
        b=0XBV1EYN1IuKKe5TX7JrfGQIl9o40YmniynwDLMaUeNkAWHdL4s17EeoFpa1ImQlbf
         MWdi/KHj7p8WM9UJdmmrW2o5h/m4Lva2C5nW84E7gWsNJY63lsTaGNqE77lpCaF9pV6m
         Hm/jcZUHxHDWo0g+YCU9NjTwzq5z1Nhh6w14aPS2UBHOO+QJi65O5DidPzAv7nI/y0he
         n44s/j+yju+WZfd1BPtk5MRZfc4swjg7uywYG+aibQaySBD7So5Ra9+OxRYZ7rvPLn7N
         XnIvBrVCsZ243LGEYXfVC4fadnfJ16WwAVDtl8ikZDS/FBQ91tjc7d99HwHwGqCADGNv
         u9YA==
X-Forwarded-Encrypted: i=1; AL+hErEcZTNJXds8hHV+g5uetgRocPwbaAr5q3rkSVdl0cSG9qzVO53PLp5iU5lKsrQiro9WLCZqRYnCW3Tbu4c=@vger.kernel.org
X-Gm-Message-State: APuU4Z9wHHqdq4alD3NzekXdU6gCRhe2e9SEKj3ejnuPqMoqXPZuZDmQ
	lz9Hbd2c0XKjujTxW/pEWuckUP6QA1kgkWmAhgYPuVkp8WXbIA27yyt9
X-Gm-Gg: AYBFou1Piaehs28an3yWvUpa+82cmDOQKlF1yEinX7NNCIiPQItHxVbTNDeiPWH9i3x
	vznJ8YovJ59QDynMg4htCJeWOcyH6oPe9Art6lN13RGw+Mr49wxpqxxorw9L6nQUU27NxoJfnFX
	/dOpLg6w5LUWaKN0wh5E4QFPhD9zH6cjYc6ETONYiWnpGXGCP4F2wtXYmpbBl912YjB/Rci6WuH
	Vl7dyVmLLEuKXpFIuNd7dMEYJ1z1m6UhV9pCRqu3QCoYyDa4ZvHXt3YgUTk1E0pjJVmK9Y/km/3
	l5iJAVCUaKMKIC9GBMF1fE+0qXKgNkNjXI6v9qguxgcnkGsrZGZHMclCSFSIUp+pjmTvMheI4Rd
	02Gan5pWe/3ACzAiDtNozostdOHt/ImTXuYlFs6Swh8fC0lZvtf5w2uO2pZqeZd30lB6PYSQNKm
	A2RyPazFFgm/LANuD74ooYmOtY+cnyelq2sGYJfjIgInp+Mez81ydHPfV/OgMT2FGFCJb2xb78W
	p53E8oqAQ9pqj8S0sP+3+DelUUxPs8neLvb6WiVEmC7lGOTGLLo/VA0xdTMYiEutnwbWiPdAel1
	GzyIr2Gj73NvXUjBf8Rj6/NuybzgmzVu0EHtna3aFH3nplDG+pHVaxTLagWDklkwwFnAYNYZ7JQ
	PkR2uY1sU7rYAxA6VVJQ03FQzoi3od9PNonp02VsVV0Jdbx9R4AQw
X-Received: by 2002:ac8:6f07:0:b0:55c:5ebd:8824 with SMTP id d75a77b69052e-55d76a6b9b2mr73460561cf.71.1795207360201;
        Fri, 20 Nov 2026 12:42:40 -0800 (PST)
Received: from localhost ([199.170.132.196])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d788116c9sm32657731cf.4.2026.11.20.12.42.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 12:42:39 -0800 (PST)
From: Tamir Duberstein <tamird@kernel.org>
To: Jiri Olsa <olsajiri@gmail.com>
Cc: Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>, Shuah Khan <shuah@kernel.org>,
 Andrea Righi <arighi@nvidia.com>, Xu Kuohai <xukuohai@huawei.com>,
 Andrea Righi <andrea.righi@canonical.com>,
 Bing-Jhong Billy Jheng <billy@starlabs.sg>, David Vernet <void@manifault.com>,
 bpf@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, Andrew Werner <awerner32@gmail.com>,
 Zvi Effron <zeffron@riotgames.com>, Andrii Nakryiko <andriin@fb.com>,
 Emil Tsalapatis <emil@etsalapatis.com>
Subject: Re: [PATCH bpf v2 2/8] libbpf: ringbuf: Prevent NULL callback crash
Date: Fri, 20 Nov 2026 17:51:54 -0000
Message-ID: <179519711442.18576.14389384506684582728@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <ajVKM9tJskwg9OFa@krava>
References: <20260618-bpf-ringbuf-fixes-v2-0-33fde039ddf3@kernel.org> <20260618-bpf-ringbuf-fixes-v2-2-33fde039ddf3@kernel.org> <ajVKM9tJskwg9OFa@krava>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

> it'd be easier to review/suggest the solution with more details on that

V3 includes the caller-owned iterator and tests using NULL callbacks.
It preserves the validation merged as c0628a0659b6.
