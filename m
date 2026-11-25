Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795585811;
	b=2TBcHIWwKEqWjLjW2pbrvZhII525fXdbsTEVMYSpr9XVhT7/HQpZTAwFzPzeMJrSsS9t
	 JIVYiwqki3AG37bwKrFPWzaPn9IXSnfdEtX5FLj/N1U8BH3SVNkRHTUCl+58PmSYHlSl8
	 YiCRATkqPTSw6fVNylucvLygGojatWa7f16OqOMKEe/lLJRE3zwS3zG5JWR/Xj8BNr3jZ
	 TzBWxTBeSaq7PVfPG5J9jtZT9l5x1Cq0reMOAiGXx6yWaFmwqzcFiQssTjCtzTzl6McEk
	 RYD8RcBJxgyVwP79eBdJztqavKyGFlSQvy2kmd56bnjlDxitQxz8C10RAMXoGbBp3kA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795585811;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=BpPvj0nWvmhIzxo1GF3DFVFg+7nJdo/Em/Vn4/tSVqA=;
	b=tw3SU1Hasi5Vbq8Gc0nKX84yLAWK4ucqMpmWOYlZRnLRZhiUFZbVkjcGTtMrOzR/MWqx
	 rSXk1OsOy5mUjgX3jdMWPfeXHoYLV6ZsQl1EqGFSBOG9qYHD5/vMV14pC3B7bDaEqbYSF
	 5kTBbQJhtOGI6Rjxp5+aJZXo4C6jDLY9PPj4RuL3sI6bTmtjEgZIrXWi6T0fv3tzVx1Rb
	 hu17l4W7vkwfDJqnQ8V6JyhRTaG5dP1ek6bLNNN3pbj7Nn3/C77ApFQgrOAlvV6QOBCnp
	 Y7oU8/RlrrIMS/Hhkv9fC8NdQ/RV1lD/ExXvErKPbmk9Uo1OWPCCqZYNyLHMmksk52Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=brainfault.org;
	spf=none smtp.mailfrom=brainfault.org;
	dkim=pass header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=bnPlrbv1;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A911606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 05:50:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A911606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=bnPlrbv1
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4bb61185057so34314415e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 21:50:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795585808; cv=none;
        d=google.com; s=arc-20260327;
        b=FQvt5MW8v2hoQ+Zwp9WikSQrUtr433mC7OnhBpUhOVC6TJXWrbpZPmn/aQTdzWQcOb
         ZczbNRqDgZ3DyBFMjEU98X5dfEPfoE9SgqsuvwbHErAsdyeTWx90gch2xRySVUpwHrQa
         Q37SEKHT5VDadQkimg6DtOeLSfj63VzgUtFIZEDiyg5krpYXgaGPQLRO3xQVl+8/kjLP
         CIT1w6imUnn+Azmord64HRtVDqA5+SP2VJfaEpDkpoS8Uq/j9ZebMEm8/2u61gCSa5YC
         olyBG2VxLbl96nW6bsVrx2J7m1XGC6cvKgV885id5fQ1hzplg2kD7Ck1Zljj3XjhXHqk
         Wfuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BpPvj0nWvmhIzxo1GF3DFVFg+7nJdo/Em/Vn4/tSVqA=;
        fh=pbJ5W4vFVIgzwFCqx1TBWKkc6nhWIwbd6Gsl1jH83os=;
        b=XI5A0Kn8P38B6m1Z9oOQxABNwYcL20cpfRjQaa72IbRJuxwDjncSDljHTFK03vIa+y
         RehY0k5j5m8HThfb+6BSrtYZtWv/eUV4GWPBStHhI1c7t6oMCBM9dIuHWhW7TQGN+Tgo
         GkSpjfogKNSqg3JhufVim2YdtMfILPokQehYBCHq+u74OK5FFslxjXD5+rrieJjJoo4M
         7po2hyovKqigkmF8a6E0f1vrAepthOKG1Ji/XE7JOG012BTSfgn7Zt6LaOqREzBh81Il
         ZhMC569FuCt6TsTMSF8/z3dI9RSIJHMpU5hpksDQIPXEpizngwQ9fhntr75mdyIkjwCc
         X6Jw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1795585808; x=1796190608; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BpPvj0nWvmhIzxo1GF3DFVFg+7nJdo/Em/Vn4/tSVqA=;
        b=bnPlrbv1Tv2qN6z8HRl2pjw0ILggVDP3fGye9E4RcaEqVAyd6WJ2hZuKVSJox+Ib6j
         bKAdNeAmqlzWvrtedLIBnqiFdzbGX9EfvOs+7gv0/isLfXRdFyGkZedi/twgEMXA0e18
         TGZEnt8CdPla6Blyz8WrbwVVywXMTn6Re8PBoVzAFOjgC+Cgc+dyoktfsLvl6c+pXPAX
         WehEviufV1a9aUiTNzGhG5EYHC8m74yQQoj8VfDVAATuUiI4xf0GVJMNReINdqOy8hha
         AxOWsSHncbnt7Uzzb88b7uDyLkyYvD4z7RbB7+2iqhxU6nLWEo2hZd9TK2uddYvxk2X5
         QOCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795585808; x=1796190608;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BpPvj0nWvmhIzxo1GF3DFVFg+7nJdo/Em/Vn4/tSVqA=;
        b=ooBbEr+mv1sNz1QXzzqAWWylxp7kyFyxnNxdyqPN2OtOZdhP9x37GE9eB2m8AZB0CB
         DG3hOLqOZZOfGQCZ2lPQxwdjiAxC9wc74R+DZd2E60Wl54seIa68MwoHZp7ege0DQRkX
         8r5LCbemtwhOsWFAeZLvP8DDmMJ5VimCkXyLMg8GrbGUQZN0LZgPxwGOJbfqHGLJ/vWl
         3RzO9wK+/MGaLiGZm/ZvQT0eG/6jklSKKiVLENQNiuT5vyOVXj6CT6FP7qaMujVDN78i
         /kdyb0kbFvL547kUqAJZZjTEBORMF2wCWyXbII/Ffs6L4BtIebRmf99OA6Qzb97FGCij
         BnCw==
X-Forwarded-Encrypted: i=1; AL+hErHmxBqHF4HUfGNzMVhz04qHnW9sHOY1jkuNXxjprLxj1oUm9MoEd00+Ifto1SEN1Ti4e+pQ0BHe7DBHl+0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+K2k1TWht9TjJr3mlX9GERCZEXLkr1oOVRVctBtokBe/h4mK8E
	BtzROu4uFRwHezlgcMi8WqNAxxuzAnJoAsGb44DUrMK/g/7axnYbVLFTfDv9S8I2gpJcfOhraHw
	njRH5IDL+9BKYBRNhG6BBMZrmiSpjLWcNBk9Xt9FpOg==
X-Gm-Gg: AZFdTZegMhaFPzQq6WlsyzrajkfYBsnVmOpRzHzoifA5P9nyy1qPKlb7YcB5Cu9KHCc
	HnnSWBSOgGXlD9nNGa2rvjVrNJqqRpx5+9sq1Mog+1uG0S/BGGNSsbidTff/3VWSdhW+8vfRygE
	BdtQKb3y//3xlgSyiyPLDP0MSaH8gBlJj4tZwXsrathhBehjJ3oEvRZ2aZpmy2+A0ZpIclLHyBr
	R6BJx9OK9bqzViZ7MNgEIGBVArfpsC13cTUTM8bfWzHKUJAWo1nCxYiohbdtzcrHdL3qw/ShusA
	balaeXdXrYrnMAw2aKURNfHUWrm8AWRld//q+DIEqAdf4sPqaHb32eeJkna1Aa3lKZQCihaPSpH
	r8Z4UW+m5f/P7LEvsRY4oCfCEdYm0Y9KgHQ78XQ7gi65H+tZ6XwwaGzL38WR227CjCcHNG1vT8O
	mVpCET4pNo24gNOZdl6JWzBelt4lMagNVgf4RdG2tqP05wK23EvhVAVpQ=
X-Received: by 2002:a05:600c:1d29:b0:4a9:2a92:231f with SMTP id
 5b1f17b1804b1-4bb88804d4dmr362487905e9.7.1795585808512; Tue, 24 Nov 2026
 21:50:08 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260921111402.120911-1-suunj1331@gmail.com> <20260921111402.120911-4-suunj1331@gmail.com>
In-Reply-To: <20260921111402.120911-4-suunj1331@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 25 Nov 2026 11:19:56 +0530
X-Gm-Features: Aa3M54olVHavWeAlguF4P6c6438TRdv0cvM9VsXLh3lRZmC_JVPz05hHC99ALdY
Message-ID: <CAAhSdy0Ev2MKxS6J1OrD+mHKMw-izwi5ywHLJZT4fN0K-U-CHw@mail.gmail.com>
Subject: Re: [PATCH v1 3/5] KVM: riscv: Write-protect G-stage PTEs atomically
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
> GSTAGE_OP_WP clears the W bit with a read-modify-write of the entire
> PTE. Lockless aging can concurrently clear the Accessed bit, allowing
> write-protection to overwrite the update with a stale PTE value.
>
> Clear W atomically with test_and_clear_bit() so that concurrent
> Accessed-bit updates are preserved. Its return value also preserves
> the existing behavior of requesting a TLB flush only when W was
> actually cleared.
>
> Signed-off-by: SeungJu Cheon <suunj1331@gmail.com>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup
