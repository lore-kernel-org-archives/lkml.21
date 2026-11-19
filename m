Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795112409;
	b=geOABKR3WQWth4u8LbyUGqibxLBmryFPLnOVXmWCvgyzQbODEbRRfLIRZZeeikH5Erjx
	 8uL79Yl+HWcO1EO8MfEWeS6vm4TnGLwAf6YlekY8rKwi+3sJk6IGtFWgybiZaGtrSjWtb
	 w7bVc/Uo8dez0yco0LplUA9mIPKXOS9bzYbhiKp8jI/995sp2KT8Y9PTQY1wxL2WPnZX/
	 L+klirFaZtiK+P97TIu7Yd2ctvjbUEVdG2mvN6vFf2lorqT+UNX7ETB1AbJrAHfH8mCA8
	 XBsWNJdWO9NGyHFXK1Yj1rt2cr2S2AZRzFIaWCAAGglauE6cQtLjSvo+Xer1RtWdnnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795112409;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=i5hy4P4exgctsWNbL/FQFw8EeR2kORRjAFNQsoHveUE=;
	b=HKlcEpyRYaT6VTxoSDoahtzj6hWbPWcToB3Pse0XnLuwviiQkNax8t6DeWDRcOlc7L5F
	 pWP2+zqdQX//lRPJd6adFJ3k4LKIQTDhgVGCtAwmlw+n/Pfj8KYx9a5U+q3yCKg6shD+5
	 kzxiEn9a4ZlNThnkUxWaqMAst7U8OZti1pZu+INc6aZpHwNoXU+fzZ85yRnxWVM4G+ko1
	 twAbXq8Ehnzs3sVGvouWUlrc4Vqm4nyRK5PB7kRl3B85uP87sOQVV6eFo9WQGC42iQZX4
	 kXy8nT3HhquRHg0fYUS9DeWO8Khu0xJRqbLwiv+H1EjxJU+kQJ3qmGxd8Br3vAq72Jg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=IaW7XsJT;
	arc=none smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76F2C606A325
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 18:20:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76F2C606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=IaW7XsJT
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c40e30c26a4so264666566b.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 10:20:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1795112407; x=1795717207; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i5hy4P4exgctsWNbL/FQFw8EeR2kORRjAFNQsoHveUE=;
        b=IaW7XsJTep8I4VUFC5bPuLhX6Kgj6po7k00Tj5RHys5QDBwgt9vIWwYE2WPpM7lasg
         N2BjFZ7T6MUt0kh/vkWQDbJgKNc7Fc1q+bCFDeC5MRcbM2y65vJUTbYoESuLdvreZaZk
         SCGBnuFI3/g+t/zEtPLD7k7zEpY6cwCox8hpY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795112407; x=1795717207;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=i5hy4P4exgctsWNbL/FQFw8EeR2kORRjAFNQsoHveUE=;
        b=ERsigHxEHCMGKYH2w8PpDbvWy9lpoPlHTboNqZA42qUH5DNq9hNejOozp0fZ0TLScK
         eCFF2eXAFuPjzdgNcPdGnKswgPu013EBZ9ic9Y/BssGuMMfPnC0WIm8sSforBaW6US7q
         2C8sr4cEuBDeU8JML7ypyvm48r9IpZO06EmW9ThaOAOH737lUdzCnsntbjlGQsZzTRSy
         3m0J9A/stjZEi/w3OXEqITzfm5PYGeosiyd1HUFiQ90+rMiGF5jfopgP7IiXCDHQl2tm
         YrWTzlQYZAho8+Z+7TcphbHNr/9CVqLX7pm4b6vzj1AgIKJayrcV+7Al0LF0Zu1Z41/U
         E5Fw==
X-Forwarded-Encrypted: i=1; AL+hErG/nqVAXsn+WtGt/dAyrVflsTBOMf0AHoCdSrCqal3EYEFVcLoyf2+GqiGE3zUDV3xhkN3GxTEEPR1dHjM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8S/FbS7eBd7eEJGLjrEjSHA1TGoZWM4PXJLrIRpFSZL7ffuwHF
	RzT67Zk7SxB75KTlaSdEXX2/S/q4bGyQlifDFTpVYAh9G/A9pK0kc10mgDh1MpvnKgP4FrkTvOe
	bTVpSGQ4=
X-Gm-Gg: AYBFou0Sn5hEShMoKtu/augC40ptHP5LnQrupeKtQl25/S7FlVM14ER7VVa+H6FqtC6
	hERGHr6HrpljQUiyqo8M7I1rOb9+kPmKomEKJbBgyc9QJIm/TVYF/PPJ+Eyubrv2stJybGUIyVQ
	WyIAObGilfxsWbYHflQfpkj7uzWS8L2ZhM7NQY4ACY4Uj385Lp8MWoicUFra8Cg+mKoYmiIfDEw
	N1aE5spysfiLrXj0S9/NzRk/FIoZ3gKdyvjCl/JVpGGbcT1//9AbDuVAY4YBNHqt0HzdjrFIWgG
	wTsvwsJcWXzpXetVxE3pa7XXhF+CguOXfq/jdnhqRmdqHz40TlnXT+PlQHpp45svHEfEY5FA7sH
	McBjpJsHrKPY/Ni/9Rx3ADtFE8OUcI+9rnNVZWoavHpoNcQx8thkR73lijkxSSib0HoYfnYUh/X
	XNWANXFO1sbyoJQA56ewOaoagZaBsThwqOCp0Kv4rZfQICIjAyYj1CBOK0kSMLCkl3d3ksit4Ez
	bgyaNW86b3BlxVPnVOol2KGN8qRUFlYRR0Ig4ykAbueOGFzo/ArxvjuzxGCGf/cVx6c83o/FYaX
	EknoesaSRyhdRetLVyvOcfskkmzLPqqOJ/4abOXZh8UdJM7WwoF4HdQWomotiQXzBmoMZdu19Wv
	VtPI=
X-Received: by 2002:a17:906:ad8:b0:c2e:4397:7c82 with SMTP id a640c23a62f3a-c513a5e6a7fmr63813566b.6.1795112406772;
        Thu, 19 Nov 2026 10:20:06 -0800 (PST)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com. [209.85.218.49])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afeca8dsm21536766b.75.2026.11.19.10.20.05
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 10:20:06 -0800 (PST)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c4d5b2db4bbso309420766b.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 10:20:05 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEcyAqfJzGcZednC3fRhkVWx/OKXBEiugwj5SmL5/0az8YGYrakXkIeO0a9qbasYDmYNBnXTUkOGg7Uar4=@vger.kernel.org
X-Received: by 2002:a17:906:394e:b0:c40:9b35:ad91 with SMTP id
 a640c23a62f3a-c513a854929mr60584466b.13.1795112405562; Thu, 19 Nov 2026
 10:20:05 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <avxpkXiyWwLqqAuu@sirena.org.uk>
In-Reply-To: <avxpkXiyWwLqqAuu@sirena.org.uk>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 19 Nov 2026 10:19:47 -0800
X-Gmail-Original-Message-ID: <CAHk-=wg2n=x77DKc2Z2sWSysTmQ25_S+EGa65Equvj+KtWkVCg@mail.gmail.com>
X-Gm-Features: Aa3M54oLOxQwnMku_wqvDfSMTe9hGLPtKFwHEgAVaLJ7Yldu6AOkOEZlATZLzY8
Message-ID: <CAHk-=wg2n=x77DKc2Z2sWSysTmQ25_S+EGa65Equvj+KtWkVCg@mail.gmail.com>
Subject: Re: linux-next: manual merge of the mm-fixes tree with the origin tree
To: Mark Brown <broonie@kernel.org>
Cc: Mike Rapoport <rppt@kernel.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Daehyeon Ko <4ncienth@gmail.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 17 Nov 2026 at 06:50, Mark Brown <broonie@kernel.org> wrote:
>
> Today's linux-next merge of the mm-fixes tree got a conflict in:
>
>   lib/assoc_array.c
>
> between commits:
>
>   2dafc9bc491da ("assoc_array: find and collapse in deletion without gotos")
>   4a5db94ad9b76 ("assoc_array: move deletion's collapse into a function of its own")
>
> from the origin tree and commit:
>
>   37ff457ec4679 ("assoc_array: discard shortcut when collapsing a leaf-only node")
>
> from the mm-fixes tree.  My fix below just drops Daeheyon's patch which
> I don't think is the correct resolution

It does end up being the correct resolution - 37ff457ec4679 is fixing
the same issue that commit 48691075b0ad ("assoc_array: don't chain a
new shortcut onto an existing one") did.

And the conflict looks bad just because the whole re-org to make that
code readable (with a couple of other less important fixes).

I htink Andrew already removed the patch from his queue.

             Linus
