Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795712700;
	b=MfLF98aT+eVuh7aG8fR3NojDhob85mRsRdEjaqHQK+yg9TQiYzvSBUOhXdgFq2BkfDJS
	 nPic/oei8W5EISnkxyTzpnlPuvNeo8vDMt8kGvI5ExjwOcfl7GSbicJ5sl4AIMwOAzdPa
	 CjGkL3ddThXlKaDo0iyDY95vxjGcVMNNqBxc2HhNBzo2nWem6hjqxYbycMI7Y9vIODLAK
	 D+FOOE87tPeN5lHaOUfmq/JCjhUOraf+Fiu/UNS1aYe7mr5MuM52VutnR611QBeq08ZEW
	 Ny3IV9VASTne1HFMnERqwR9hH0g9xjV2DUU/p4wTOLaevJqCw5VO411W6vCCdKAiZjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795712700;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=kcT+zGUVm9NECrDFd7+fwJkTsjEygvZ1aBy/ZV3pq+8=;
	b=mYXXfFcRSv4Oc8YZfYq/nKGc+eflwkLzN3VirUc64hxnAYV/aM4DewbJVHRRrOA+0YtI
	 ir0l/AajK4xHq1Zhkiz3hYJTcEEOIjDRJvLPZ994lhZI6RcAspeaLK3aqPWxM3JUCHda1
	 IKxrwMkHmU+/OI8hgbIRFhYFKL8AJeMhMk974Bcl+3GGxRuaZoXnvZkXrv/tkP2qLHWEx
	 gviH4cHlrFnIO0JD53hON/0YY6cLTtPc+Emc8v2z6ezLgd9FrgKKMgF6q+iwOvNxZDGl2
	 IKDJR68GXcvR2T+5341TP/fXl3xsrRci501BudpVbXEqc7X/xOHJ1JWfueuGP21gbPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=BxxC9JGq;
	arc=none smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFA75606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 17:04:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFA75606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=BxxC9JGq
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6bb06dc1fd5so4507190a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:04:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1795712698; x=1796317498; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kcT+zGUVm9NECrDFd7+fwJkTsjEygvZ1aBy/ZV3pq+8=;
        b=BxxC9JGqbobynwHNYvWHQIqUv+WiHWeiwVCXL7RrUV4ugYMypy626gTal19sGaLgDo
         +eHY95uW+A5VkxxyqLvRkeYN5r30SfcfLx4fsplgc2Km+SLKFjthIer2q1Cu5Btkuhf+
         gzZ+35QulPAXACbFUn+TQHEmU6RdS5M9MZb3Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795712698; x=1796317498;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kcT+zGUVm9NECrDFd7+fwJkTsjEygvZ1aBy/ZV3pq+8=;
        b=1nZ2TM/lGEHl8Nn9Ax+/3m3zpuk4m1CWOZqXZmJW+gXFmtA9y9PXnSMtjidYBsTToD
         fCrj19w9vV1b1AQ91y4GXNwZX+lPEPFyAmzjo0N5bxFVqlozKskinEemJ3LxlJ6QWs1r
         3eY1vby6qs3cHhRBtb9U4eKrG7bRUvE3kDC+hAolGz7bwa699FBof25VH+32wFgULmZY
         WhZUnlKb9Y4RSUQX3E8d0KPIZeJuDFDZWxzZzPTvPljN/z143RqchWUKmu42HgMW01Hv
         T2MaICchkYtygtk9Cxph4WRhkE96u5Q5z4BErerDDCr9yhK+7BpCD6Y8dtoTPStb8qLv
         1nJA==
X-Forwarded-Encrypted: i=1; AL+hErEJSrsw38MTO/QJUgVbvKvucCUdxMz6yR4oRMvqrq71feXXb2bJuy+V2GJh+TuortPmw/Fp2UlVnN9EgOU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/WN5KnKfo2sh/eM9VVsloYCJBGkGiyREQFNJom0gVsE6B3V3ny
	9qEldJhs8+bJHUK0ePnAkB+Q6EZQe5Y4zz3tplZ1sgNYopKdwxp1DWquuJ2MVmy7ll1epSwRP34
	3Yi/S20A=
X-Gm-Gg: AZFdTZdaiR/3Hg4frddThga+TeKso4RR+TSZ22Y5d+THDfJzYiwbY7qEff62J98/LwN
	rJsc3ehNmk+QCc5teeoqFWyVViIrnql0qgSeHbGSET5+N0N6/F/lepxUd9wRcxl4z26/wD8Qrrj
	NTbXKWmGE6BCvbIC3Kley6amjjOM60fvQ71xzTrbRSIqlhIpEebgNUyaCYhoVRIsJa4OnNzztxV
	/EKRLpZ7PKwnOs8NfUmiVTVAyv6sn4Xuq0JpEIKvvcxO+7YW5qTl2oHv2mz4KMkkeS5d5nSQtM3
	T4/H1YP2OPv5xRCM2fQyFjCXLwwUH9jKuL41vIOzfRiDO7HWSQok+7Fw5atWXs4+45NvX8X4v1q
	dZDW/9ZJzyhXfNavDb532pdpR0RCfoUYR0pdgYqM696OQT4qbGrwZkoheuHVeJ+32yxRf2hVfUM
	X7we4J/c5+VCW36yxV1+4eI95033BPUkCQgZ5qco/2hj4RknSWHsqmRdipaP1K9cUpQLwkUv9D3
	BYYyeryfqO9w104CXrF7/u+VkwEAMDKPTaM16uY8meH2uF3oYrrW+uhCcfnErPc/i4w7i59kTzu
	PPM5qAhkKxxG64jrcaZNIxw4CzeCGKT33qupj3umZg7k3grcvKvqGcSYayvvnTYPfhPU9a8V+HF
	bX2A=
X-Received: by 2002:a17:907:1b1a:b0:c46:7ec3:fde2 with SMTP id a640c23a62f3a-c513a5ea1b5mr1711123566b.11.1795712698032;
        Thu, 26 Nov 2026 09:04:58 -0800 (PST)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com. [209.85.218.47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae6663esm777177566b.21.2026.11.26.09.04.56
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 09:04:56 -0800 (PST)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c4d2b741ed9so1160885066b.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:04:56 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGeh+iz6QY/NmoDIMQlMjFguN5tyXjp+3G2pTYFghdIu0W8N96Wd3CK7CRn0e0uMckN2Y4PBBm1h7p9Wok=@vger.kernel.org
X-Received: by 2002:a17:907:ea94:b0:c29:f5d8:9c73 with SMTP id
 a640c23a62f3a-c513a9aa815mr1870553166b.34.1795712696391; Thu, 26 Nov 2026
 09:04:56 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261126-lklm-sysctl-ctx-flatarray-v1-0-d7fc9cc9b03e@kernel.org> <20261126-lklm-sysctl-ctx-flatarray-v1-1-d7fc9cc9b03e@kernel.org>
In-Reply-To: <20261126-lklm-sysctl-ctx-flatarray-v1-1-d7fc9cc9b03e@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 26 Nov 2026 09:04:40 -0800
X-Gmail-Original-Message-ID: <CAHk-=wir6u-wFF8+V6DZTqJUsgvRrSpkZ_FV9QcK58G-b1N7bA@mail.gmail.com>
X-Gm-Features: Aa3M54os_jwm08rJOj6LitTJqSmdyD486qskvu_4qaUDpWGX1bG3bIuR7eJcvH4
Message-ID: <CAHk-=wir6u-wFF8+V6DZTqJUsgvRrSpkZ_FV9QcK58G-b1N7bA@mail.gmail.com>
Subject: Re: [PATCH RFC 1/9] sysctl: Add struct ctl_table_tmpl as a distinct
 template type
To: Joel Granados <joel.granados@kernel.org>
Cc: Kees Cook <kees@kernel.org>, Alexey Gladkov <legion@kernel.org>, 
	David Laight <david.laight.linux@gmail.com>, Wen Yang <wen.yang@linux.dev>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 26 Nov 2026 at 03:47, Joel Granados <joel.granados@kernel.org> wrote:
>
> +/* Template version of struct ctl_table. Used for registering ctl_table templates */
> +struct ctl_table_tmpl {
> +       struct ctl_table t;
> +};

So I really don't like members named 't'.

I see why you are doing it, but maybe you aren't aware that we already
enabled ms-extensions, and you can actually use *unnamed* structs in
templates.

So you can do

    struct ctl_table_tmpl { struct ctl_table; }

and that gives you a new type that you can use without any "t." kind
of thing, but is still distinct from 'struct ctl_table".

Note: being unnamed is very convenient in some situations, less so in
others. If you actually then want to access not the individual fields
(which is very easy), but get from the template to an actual "struct
ctl_table", you'd have to use some explicit helper wrapper, something
like

   static inline struct ctl_table *template_to_inner(struct ctl_table_tmpl *a)
   { return container_of(&a->procname, struct ctl_table, procname); }

or whatever.

Honestly, right now you seem to do something really ugly: you have
that 'template', but then you hardly ever *use* it as anything but a
top-level interface, and you turn it into a 'struct ctl_table *' very
early. And that looks like it's done exactly to avoid the whole
messiness with the 't' member - but it also measn that internally that
"template" has lost almost all meaning, and it looks like a regular
ctl_table.

Maybe that's fine. But it feels like the template is less of a real
template than just a wrapper that is only used at the top-level
wrapper and then never again. That does *not* work well if you were to
add a few extra fields to the template (that is then *not* in the
struct ctl_table. because they are only used to set it up). Hmm?

              Linus
