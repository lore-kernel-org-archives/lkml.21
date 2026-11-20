Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795207384;
	b=mk/RyHWVs6T0RmxVYS84iyjY6+gZOx7CLzak11TB1cga/Dgt2IfhIEYFH56mCbFrSiRR
	 qy+1oAOVJ14PxjXU1oJnYuMuM9rYvVXC40rOCiQeLEDtyjcG0nIBWWpkFRg5wo0rKR997
	 s1SlkIeiH+puEXUXmDkKu8g2UtAqMo/AWTEFPWZLpBM+dQMRfWEzyKrl3SxGUlAJ61GqV
	 LoYfuigXo/dOvcoENgMaQJ6vMuy4rViyYZErE90UkI0LNqYTsGZkEfKTtU+zWZWCpIEWX
	 teVNzZr2JVlPRpxtmVxhAbfckwS4phx8YyTNLaGfOiDqLeSLVOwIT9P7xXJMd/Yx27g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795207384;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:MIME-Version:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding;
	bh=G8fdWfQoKSFg5MeXLSdTNeJQWSm1UpjIDHyYt8X2axY=;
	b=veWwtG+5qTlhnaSs/QDVJ8VYDG7VqSbuc5HqErhZTt8V7Wc+ILsX5jk4/DNg6AN6Jwx0
	 GWz5VqihIoFCXP0QmrlPPJkumcWB7kbmw4fXM5q2prI7ik3AyIsjiA5HNOCSfOFs6pvS7
	 2VEZ5oWCMLY2qy2gIwikJhX8NF6aXUmUH/Ewg6v73SJz5mCmbnpPSdGPVm6JkyH9wOBcn
	 QcAnJ4lY0QXnx3Zv+nBbO9pdbScw4WTg1EQL3aYh606IV/ysmYGo5JY0OHGPICL6hnQgr
	 +X7r4iZ1Gmk/PVroaylwAJvy7bqSUDxa/NDvjjsLIkC90iksxJY4jNKtfHikbnlnEFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=kernel.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.222.172
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2C85606A6CC
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 20:43:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2C85606A6CC
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-94961b68685so115110985a.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 12:43:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795207382; x=1795812182;
        h=content-transfer-encoding:content-type:references:in-reply-to
         :mime-version:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G8fdWfQoKSFg5MeXLSdTNeJQWSm1UpjIDHyYt8X2axY=;
        b=Oh807CB/yFiWcU4gk50BrHosC4Ush+ZXDowzm2mN77RIh94yqE9a23VYpaU271HcvV
         dMOi3b2zF5xtXawR0d0psNpvblXNikjiqW1V1pAvX91FnExtzaYVhg/9W6eMHWmv+z4c
         aETZDxZ6IjhupFQTnPSXxxFUNDqSWK1lRfeE+7/EWdKbAxPYfgufcgyiO1/20HgM9zEG
         ugw1ju1nSbTN+C0b4rg+WGuaMPJnDTU7SHREFKWxsiZu4ro2vbk37DorxRzPSdddn3iB
         GtZOVBSqAR56jUhgajbdhjSw434v2gnFDd9y2puZu9+9m41qnaz0jl1T1Zk74ehSs0m6
         X+4A==
X-Forwarded-Encrypted: i=1; AL+hErEpLpJ0oJzCQzs5n6XSGUZDifiIcftjQz0juee9JO+VPOi+4SYVR+YkYW1g3CgdWKs1KVH6bs9OCH3L1YQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9GKmPQKtrASs9pIvDKLwDK09TpKMyObT8p193aM8gbBO9i5j5u
	CVdCySMhFemWvjMnJGCVZFwAlwJAa8Uy86rXuA6EyYPcQnkEjnaXGbI2
X-Gm-Gg: AYBFou2gzd13T/z7XJv/UPQLraIMQiA4uE6FTplXF4BPk7N4XK/raJ31wR5IAkHHPZK
	Z6slaMFzTEFQwW1TewhHx5FPa/miYNsaMe8dgCbkEfQg5dKFKUGCE+DpVsWPLcgxY4eEB/4ELuC
	1eDfqEor8J3QaEYvD+pJo+ETWfDoe32oeQiFJTYDEr9r+BcJJzM78O7N0wa8SA++GrhOnfI531o
	wEmy7SdM2iJT4npf0vut6Msxm4p/NFNJDjQ9rgD3XwwASUhk9bTFYPWBW0Gq8LP0wWAUNZi00bB
	0wMnI0Ivlfi4A56lXwSujTiq6S97WE5VOjIVaV0+GGVJ6xt7osmJRqKECPBQXeSf/yemgZ4UUQD
	Gu20u96zLw2Ieg9dsSX9BuMnZkjVm2ZEznGlHpfGK8MkW/VRiXO2qlp0oyIse63zfON7HqxNcvr
	XEw8u+K6admbY3H+n1yoYGWjdIWFiI9tMInlx+6duglhpK/zTK+XZLMewDzqstyCoFlLC/rG07+
	tcJlspEaqJqCSNzL74fK0Qc/G+AKTWD7btTTOBu+EZqFMvZIcuwErp67s5Mr/Wyuz6IXc26zii8
	4U/NwSl44VFRj69sm7XEp3bBiufA4Y19HTsrXqPCXeCuDo1g+6m/GH1MwCVAHxmxYxi0DipnqNa
	YX7oGaADg/Gl+SrvGU0M3I54UCwfhaF5vrbi2Mo2Esc+/B55pyWRV
X-Received: by 2002:a05:620a:6c1a:b0:939:ff85:8067 with SMTP id af79cd13be357-949ba9e9b81mr595306485a.30.1795207382282;
        Fri, 20 Nov 2026 12:43:02 -0800 (PST)
Received: from localhost ([199.170.132.196])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb3cb882sm278211885a.27.2026.11.20.12.43.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 12:43:01 -0800 (PST)
From: Tamir Duberstein <tamird@kernel.org>
To: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Cc: Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>,
 Shuah Khan <shuah@kernel.org>, Andrea Righi <arighi@nvidia.com>,
 Xu Kuohai <xukuohai@huawei.com>, Andrea Righi <andrea.righi@canonical.com>,
 Bing-Jhong Billy Jheng <billy@starlabs.sg>, David Vernet <void@manifault.com>,
 bpf@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, Andrew Werner <awerner32@gmail.com>,
 Zvi Effron <zeffron@riotgames.com>, Andrii Nakryiko <andriin@fb.com>,
 Emil Tsalapatis <emil@etsalapatis.com>
Subject: Re: [PATCH bpf v2 7/8] libbpf: ringbuf: Use compiler atomics
Date: Fri, 20 Nov 2026 17:51:54 -0000
Message-ID: <179519711469.18576.16732977583563940939@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <CAEf4Bzay6HokFa2CTsoQt2SLQ-3WWC+EUe0b9KpT4Ju2TvBg4A@mail.gmail.com>
References: <20260618-bpf-ringbuf-fixes-v2-0-33fde039ddf3@kernel.org> <20260618-bpf-ringbuf-fixes-v2-7-33fde039ddf3@kernel.org> <CAEf4Bzay6HokFa2CTsoQt2SLQ-3WWC+EUe0b9KpT4Ju2TvBg4A@mail.gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

> this almost fits 100 characters, I'd keep it as single line

Kept on one line in v3; this store is 102 columns.

> [...]

> this definitely fits 100 characters, let's keep single line for readability

Kept on one line in v3.
