Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.68
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795134721;
	b=CP6lA5CCJNM6MSvKhw+7ekxStgAuDKIufTQVmmHn8Dxb0nN+l5zMdMJmzfXGF2rmKYCp
	 zmZgPPKMwHsjRAwiPm6Hg8CBAwBZWzvkFEj84swywzf49jm26QmDS/pQUncblAMzrHrw0
	 uDTCUpD0IcC620mrrBQwW1L4uZxcMaPxN+FXGjkmQ6qUSEQu+0a5o/mO2A++GmGgrRwYc
	 qxt11dRri1AV/ZvS2Ok31FHIatZn7jbkP+kImjNZOf6on/jPNJYKDi6y+lpkvyNkTgL0S
	 7kY4znFFe3YkIx4h97c7RTQoSlPjGsOtVdruzOBLgwn2nsiZoriVaj96Mn/c8ld6kqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795134721;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=6I0dox9mdYstBqG9ky0WjIUXtlB7TLrMdzBHbsE5LOA=;
	b=f68JDZDASFfrIHEQbBU6CeKCBDlHcGQt2BPxOC+BENjncWC0qP/j6kk8LnXvztPve0Gb
	 j2S/7vkntoDF+N6jDfn/VAIUsYSU3OjCXaIqjY7zyknBnafSMYNWDc/g6c/Yq5E4S80Eu
	 Z9JNfaGox3FYL1am2NK8FibVskmfgDfDcHleFcY2epCof3le63FHp2kE2pxNUVvIT8vCC
	 FD4ozLlJHNZp/So+bir1Qmx87MAl+5yzBcY/tSkyCF7R9J8yKb6Yvc3pkxGcNu/bohBMI
	 AH+33rCMRg/deCuq4V/v5db1OMehAcGqToMXWWnsIMq60suV/1zkfrTkuFUfggOeuZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=glVrkyNI;
	arc=none smtp.remote-ip=74.125.82.68
Received: from mail-dl1-f68.google.com (mail-dl1-f68.google.com [74.125.82.68])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07A6C606A331
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 00:32:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07A6C606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=glVrkyNI
Received: by mail-dl1-f68.google.com with SMTP id a92af1059eb24-18818daa3e7so665313c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 16:32:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795134720; x=1795739520; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6I0dox9mdYstBqG9ky0WjIUXtlB7TLrMdzBHbsE5LOA=;
        b=glVrkyNIyYlm8wVTiuLIn+1R/pE2V9VJN825nkjbnVE7DzI/tklr0XR6PDNFu1OUjc
         A6P3ZfTwHJQxiHAjmoK4SpQIdS8Ir/katd03VOBvE+4swUu2oA+8IkTyyok1Pjj9/pPY
         jRHRWeNYDZ3yM5EUWHx+RVw95l+YNdToEWVWMBlDmJCQ5nDUi+lZAkU6M+KCBd+2W1HW
         fToXfkJkp8+luUW1MITx+x0oH3VnjO0S4X/xzsL89lshkI/VzuYPu9YudzfVuvXLiO7a
         PI2e6DkQIuvL5sJxpbyOQ9dBGmqKQnp3LSWMA4iJOQsw2EYyE1DA6dSJBL+RP9i6HuS0
         6Qlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795134720; x=1795739520;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6I0dox9mdYstBqG9ky0WjIUXtlB7TLrMdzBHbsE5LOA=;
        b=hsDmdGNG5qOsswdUUfP4cWMJptEqW3OE0eeSdTPagHCiArL63ayzPoejUAqxQvvfYH
         yyc5xsoP/uTsf5yH6OAFOhohpB8daxyHVD/0265e7H1/h7w5ZyWk3mtNIJyhMyGiwYZR
         kOYFMKn3WG0HbOQub+VW2cWEcuY9JY5wvMEdhnDrSGVxGjiru/fnt8bIJGVN9zreWiKk
         7uafKDqsjP2R4IEUluR5YIodN41/gbp0/xDvi9VDHuOkG3KsQFmbDM6eZRux+Aqu7eDO
         BWuLkuVDmhBnYHGW1ZWN7xUMWaCddDZwZZx7afqsxjSeh5BhKYSxIAllhMrY0Mc3G/Xl
         lK2g==
X-Forwarded-Encrypted: i=1; AL+hErHQ4cZX9Y8CgB5IzfNBERIijLCbdQ56ElkdnT1/B50DmJUVeHw2Awupd0TccyDr8wkfiBAQKoH3SyvTyJY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9VyhXqakvON+xiAdeMLZPm8kDF/SPDMif1Vbjfjp8Ni5zVYb0F
	R4fuN5fXF5LIBhNlmCTsW94OX8aZzc5IXr22rB3DyjI4TqKu8EruHyK5
X-Gm-Gg: AYBFou3hvih/kCqk4T5JXdJapmSJpvtZjVS/vzNFTSO3RqtCAVJmdwbzvZd+gkITVKz
	ftFnopBITvIoFROnWT6WKO07MntJOOPpnoM1Tqzuxjh6ZKNyZnUjF/spIsTB/gMDLcVh3CKsfVY
	5epvAmxZaNM4CsXW7sFRWLe8ZWTvBFP2NZ+i+0/RzYfCcN/l0RBUQNXzuv0lHx3/QTrLca5BaK9
	XGqyp+bVYEusFt/RjQStP3fbVYLBTQlrZ24DTaKwfngSHtIPabZ12ckfFP2X45WwzSt5ZhIH9ZU
	xHcwtNuyviVpe8IfTDWHJZiJeycnZLG/9VnuFmlv9s5BNNfsSp1bcA3SBkel6tYPscdQ6Hygjqn
	yLKyisnHAC/3ETOv1dSDK3gw1YLPJwoXD7j78IQonSfycZiSKYgdeMPN3ii5YKh5/lYGs7ARzNM
	IUBLshhU1iuU/VisbeKEM7hJqHTISN21qvcDIPxM/MM6GkzUK7aqHpr3D7xDaKnOSWwqdy4nzpW
	5HoddAPHrGwyn24IpGk65KLKcs/H0AhH3mFr4EhHFISILkqLeAePsK6szOvLJXt8KJQxDyDscgM
	zCCvVdixbPSbrYg+GE4hq7s=
X-Received: by 2002:a05:7022:7f19:b0:19f:cc98:f603 with SMTP id a92af1059eb24-1b5520d7d86mr2448430c88.1.1795134719982;
        Thu, 19 Nov 2026 16:31:59 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:42::])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55681301asm2242124c88.8.2026.11.19.16.31.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 16:31:59 -0800 (PST)
Date: Thu, 19 Nov 2026 16:22:53 -0800
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Alexander Duyck <alexanderduyck@fb.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	Stanislav Fomichev <sdf@fomichev.me>, Magnus Karlsson <magnus.karlsson@intel.com>, 
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>, Pavel Begunkov <asml.silence@gmail.com>, netdev@vger.kernel.org, 
	bpf@vger.kernel.org, Simon Horman <horms@kernel.org>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, kernel-team@meta.com, 
	John Fastabend <john.fastabend@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Song Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, 
	Jiri Olsa <jolsa@kernel.org>, Emil Tsalapatis <emil@etsalapatis.com>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>, Weiming Shi <bestswngs@gmail.com>, 
	Nikolay Aleksandrov <razor@blackwall.org>, David Wei <dw@davidwei.uk>, 
	Bobby Eshleman <bobbyeshleman@meta.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, io-uring@vger.kernel.org, Mina Almasry <almasrymina@google.com>
Subject: Re: [PATCH net-next 1/7] bpf: Keep XDP helpers within readable data
Message-ID: <av-SmgwQhAKI5u5P@devvm16445.scu0.facebook.com>
References: <20261117164700.2157816-1-bjorn@kernel.org>
 <20261117164700.2157816-2-bjorn@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261117164700.2157816-2-bjorn@kernel.org>

On 11/17, Björn Töpel wrote:
> Devmem and io_uring zero-copy RX put payload in fragments that the
> kernel cannot read. XDP helpers must not treat these fragments as
> normal pages.
> 
> Reject operations that read or write these fragments. Access to the

[..]

> linear part still works. Tail trimming does not read the payload;
> clear the unreadable flag after it removes every fragment.

I guess this is technically true, but why allow it at all? Easier/safer
to reject tail trimming as well?
