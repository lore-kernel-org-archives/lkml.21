Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795585804;
	b=zzkonDqeAvI2Vv8Ei6PpqqEqBmpmz1RmBuJaX8naVVWILHkx19aNuQteU5QC8yvvXMkQ
	 k2ByZdZSei27QvocsNL73nb9835tE/AbSESAPhBm2ZYwv6lIgLmaxJTPc3wNhEX3cewDV
	 k8EKBax9lWPspwZPGwMkI0pTx6bXPAyUSLe+TmYlvpVb+ACdAkrqGmX1AHAhUXyVY2gPa
	 pK5d6Gzce6sX3EsnVjnvXlva7R2PfhynDS8TlLQgzBxMxcwXsUgPOvc9ytrP7M46A/o8h
	 PNZI529/G2/Iw/np5v+abFlcvOQx6gVeptKHXYkWl3JdX0PdcIL3R8tog/bpE3faJSQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795585804;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=AJcWadRJU+vTeGGYfzg2TttCaXCo1woljVumAlihtvo=;
	b=dXJLHwnW4pef0Bxw+3YesR4ezr5XvWhHrnocsW5WcRZMQfQd1utHW/kYpQS4eDnuKMSg
	 XQ/itr1P0W0jtMeUQrd2hbNgsw/UWlhblo+ytFcT8+uFg601GNwwQkEXurvHyIDPJh8JM
	 sS26f5aX5rTxpkers7/LvoWImDQEki+0m5ZDtKYs1HUealWLOcRil8K+Iv1jhDgY58Xvr
	 tbbeP1PN0mdTrIkDLbDMP66V+8EUZMipn7h4DsiEtyJMmQ6lKWYlCcHxg4R4kag9TvqAB
	 /oc4WedMYQknLwPsVSbrYCMtwyrlg3ZXy80W5yjpXxYg1wi1nt4VnybMetSmajMs8MA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=brainfault.org;
	spf=none smtp.mailfrom=brainfault.org;
	dkim=pass header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=tzN+erC5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABCB7606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 05:50:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ABCB7606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=tzN+erC5
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4b467581b98so51352475e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 21:50:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795585802; cv=none;
        d=google.com; s=arc-20260327;
        b=Sw7YGB9VDpT3B8GXZ05S2836TnhnPCUeBn1Qt8DOOnmYoScgxz8dSVksxuSb8s+xWR
         odZ1Oz1cuC7AEbjO1MVW2FUdYP9TECAfdd9o9iLqwOETfWL4VZcWRTXah8xyBfBAwWyR
         /+9vXpYhb60zoQ+9GvjepYvevuKEepUlI+AXx/CnK0bz5jZ88CrkDypJ4J3CS427Nh+A
         5Kzpabdyre0FwN30Jh7Z5Cl5hn2LNjNGs9skV6CT5GCNcQ0PnMtlyXee203LCfkK2iVd
         o3ZNQ3OCnZCh/+XAzhyIW340ybUlK3yet/eEzJipiC+TDb5UvTn+HteBlYovU8k6ScBg
         6Q3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AJcWadRJU+vTeGGYfzg2TttCaXCo1woljVumAlihtvo=;
        fh=gpjeeD2sykx/vHUizgp/p/Tkkij5e5L1vBsGJw8Nvrw=;
        b=HEQcCQOa/0FcaTJhRM0B9XGXeGF4F40+jy3uBPcG+ZFEWlLaOE7b74CWXYGxJWyvuA
         J/GAz4VMwSVdzUTLPqLnetHfupLvoy/tdcbJhL18hSEAElKgVWoOGPAGIViLjJGtPmcx
         FPgoy256HmhDL4NtQ+eGxGYmSdO0vPWnBsbvh7J+U2A9TtQbBTAnFqt85J5swrccu/ZK
         5pUrjdb9C5lq/gNsViB7QaJUYF1wqIb4XTCMLaPm8c+liyzD639qb/tVB0UaKXxu78J4
         ROgBo81U29n6JCCxZ/ZKQp4GxC05pqbx0n+t6iFJj8giWCHTViOlDvdGoQRd1Y+6vMxK
         54Nw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1795585802; x=1796190602; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AJcWadRJU+vTeGGYfzg2TttCaXCo1woljVumAlihtvo=;
        b=tzN+erC50EEU8sQeewE5gH/TIFhlCV5lhXeoB+nc/rOmLxtQAV0bsyE4IjAvqii4pa
         qJnh3HVDVnjYAWeu1g3I7JnCk3Hzefgjz4OjEFrnIw6clNSfMdQYuds4+ge6YDJigy31
         RNYt+9P2Ia7X9bwRqJHTrkUF0qCNPheN3IANNox4eGKRHaNXGfUv4yvtgwoKiRrAnWoL
         tSWYl+ht1mr60EvgJfFOm+seUlsG49AWW72E9YxPpH+jf9Xmerhl4QfuVdkouxWH8v0D
         uMr2aEPlkKFKoOtrfDsscgfoA4A5A9ac1GSDmneUYq1vPNxb4uLlMaPG9DDCAsP7VSOh
         eSWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795585802; x=1796190602;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AJcWadRJU+vTeGGYfzg2TttCaXCo1woljVumAlihtvo=;
        b=WDlOmJ4dxJO8UDwn+CEF/VHnGEkUw1eLOg5rJxc6YgoaVpxyW5C3v9gLfGBtldElQu
         xueIZEhFmrrN5Q+4n9Guz5kp9ZDebrZVl37aX8Kvq7YXbktOTe92QX/WUtWWdBQbfFij
         wdWkb1BK8SpYaOgvkWeTpD18J6X1tW99kMGiyUHSUwE17lgMjEiXyaCeedJTuvAOq/47
         v61qquwCf366XmQj7b+HmdXcgBg31yDACg3AL150oJ8MSQq/OnNGk8/lIsJ5aPmGKITp
         Dlsv8DxjD+ShD2gGBkbOuyP5U8T+8K88uqdW740Ey7pLOcYX2bZ/xY3ADz7PLYez2M0p
         3bsw==
X-Forwarded-Encrypted: i=1; AL+hErHE8jG5JL3mpXwZDScHdjV3fig84I77SlKYImVlHdH7ZTUHwBApvuphgXSjvx4RubK5bE7oK/KuOXWnZf8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Ia02DBK0nCsSQfoVdb4rpRN5/2GB2NI2lazx7mass4aWchkqv
	ZZ38cFnvQQBusXMMwnfqzymzUr99f41Uue8pTZnnNsnVdCrQVtL3ICU3mvNaRjJfaBbDTddMl/U
	8PYPvKqDHFqAABbTw4gsDto8dtEQtc2UVHIjc2+SdYA==
X-Gm-Gg: AZFdTZffojRQSwiWpdn78cf0trXhm7erbEPC5GBuudXeBQwndQECmGAtFW+S3xrN7ah
	WQMyMEZzbkVn17p78NUEyoXqKyDZpPfXQgFuMBO1LLdqFld+el90H59YWn8JQkwyRFjbdz+U3/w
	PEg2n7JDYVjPZ2V3gIBBKCZneQCY7voVgY+2Tz4eVKaje2qBWOG8fDCav+WZyGt/1hj+zz2iCdj
	lHbsyMYnp/I3IU4tHEAGXayVO3+sXfpwsjkbmL0npadU58B7fui5RIncnuLQyeqDWH7BrYqqgKM
	RYlGP8pdBjgjTKD1L/GAizJH1+WSJkacKf2a0l6jUxGxTbWpFgxhGRGEL4tpJewHAk3nFREmKM3
	JVJsQ3wM4zRDBR8+eLAVTYz1a5ODIPGk9wxcIHUx+gcV4V/cc+xthSKOWBy7CNdVgS5YcMrs3EJ
	t7lFBqQ81ELp0tQIJoLi2GESmS1R4xaAjY52MHysJFnAaD2ZqJo+YKmfs=
X-Received: by 2002:a05:600c:670b:b0:4a6:30c3:1114 with SMTP id
 5b1f17b1804b1-4bb88922df3mr317698415e9.12.1795585802059; Tue, 24 Nov 2026
 21:50:02 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260921111402.120911-1-suunj1331@gmail.com> <20260921111402.120911-3-suunj1331@gmail.com>
In-Reply-To: <20260921111402.120911-3-suunj1331@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 25 Nov 2026 11:19:50 +0530
X-Gm-Features: Aa3M54qit6VRNciPHtVoHbdaqRLIxhuX2UY4YW1iBU3P015oUnZkIIeZ7ncDCSc
Message-ID: <CAAhSdy3aJo_S=miuWjFRwaMyd9XwDOWT94OLRysgZ3+r6-cvYQ@mail.gmail.com>
Subject: Re: [PATCH v1 2/5] KVM: riscv: Read G-stage PTEs once when walking
 page tables
To: SeungJu Cheon <suunj1331@gmail.com>
Cc: Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Paolo Bonzini <pbonzini@redhat.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Jinyu Tang <tjytimi@163.com>, 
	Wang Yechao <wang.yechao255@zte.com.cn>, kvm-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 21, 2026 at 4:44=E2=80=AFPM SeungJu Cheon <suunj1331@gmail.com>=
 wrote:
>
> gstage_pte_leaf() dereferences the PTE pointer, causing walkers to read
> the same entry multiple times. This is safe under mmu_lock, but a
> lockless walker could observe different values when deciding whether an
> entry is a leaf and which child table to follow.
>
> Make gstage_pte_leaf() take a PTE value and use a single snapshot for
> presence, leaf and child-table checks. Also remove a redundant leaf
> check in kvm_riscv_gstage_set_pte(), where mmu_lock prevents the entry
> from changing.
>
> Signed-off-by: SeungJu Cheon <suunj1331@gmail.com>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup
