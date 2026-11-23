Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795430879;
	b=Ovv1owwWSFXIiK3NwORSUc4XdNKXUQQGqYmTJR3oAod1UgeL0z4eCpJymRuVo0mOn49K
	 wtxk9fwRcIEQderZrkJBsWhiBFUQzFje91YjRu83JdlPh5fjqytEn7DyD8FxTpfCK7PoV
	 EPrzERL2durbNq3GUNKeR8sHxQNMSUtvSx6pqv3xouJO7ZO88RG9aZkpzxdvuKhx37IHJ
	 QxQMJWOkCsPuaE82r7pJ1DQK33bR3utB0A0G9YXbl4u0Nood4n7GLo5sAU3kbBvnv67Js
	 0UQT8f8unn+r2Xl0ixjQt2l89ZHyHYngFi1Y24Gh26ODkFXwRF87+ZD0ugfSV4NyvXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795430879;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=mjm0GDmjR8K/Ju3MP4eLIfUNOTpU1ZPQQpSc56ZDZBU=;
	b=bqcrfKj2/EGE/ciKMP87BxDVQh5YPepO37K/1UyMNmitT8XfJKUkRAMzqUK4ghYdsU/g
	 olpej/BY4QM6q0VPEOeoVYaAyW29GR2b3ChIcjn9rkopnPa0+hR8fL7NM8JkeyQuIkrHM
	 CKcjTYnLi/rODWAShbVerYG0IK+HiZh8pT0RV88yuHJuyZR+SUK9BnC9XTkGrn8CrgM2W
	 MDZNFaa8TAcZ0i4sWzy5jTdDBV03bQRAEkNWaoieAZhu4/onlwzxiuLj8oXixBB2dS1Z6
	 wmGTQzet8ODbbikDuhVM+8pgRRbaCT1vYI7o8SEzE7jm8CDHgP0YQMuqSAIZ6S8NdnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=KqbAKYDO;
	arc=none smtp.remote-ip=95.215.58.70
Received: from mta1.migadu.com (out-70.mta1.migadu.com [95.215.58.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F30DB606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 10:47:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F30DB606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=KqbAKYDO
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=i4faPMWfnpUZpn5ks85jG3d8Yrrr4l90SRdH3e+stJs=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795430875; v=1; x=1796035675;
 b=KqbAKYDOCpEu4PRDlWHztrLxpUtmCLF4De5W6iNp82LMYoLuDiTWO/nPVKpiM70x5L8WWI6A
 Q0To4DABf/P9GPVq42SSrdL5snwHJEz4Z91GsqVyTjOnagBi2mTefqlOhkjz2sELB83CsiKxgGQ
 t/I5FkUK6h74DoveYflnemyU=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 5937b479b7bf7239;
	Mon, 23 Nov 2026 10:47:55 +0000
X-Mizu-Trace-ID: 5937b479b7bf7239
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5be58ad9600so9579e87.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 02:47:55 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHG4qPmlZTT4HSnWVoaT6/TRWt1JY1NaGa3GalTwbiHFNy8uEZh+/QLpMgqvoAB6J0C2h4rvm5H1d+olTA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9zcHaeq41M+97VIR4HUXiV4tNcu8fxBfh1dnpwNC3XRA4e5GZu
	nX0xYhKgjWzQKRbfzHMOM4yDuCu1CkKb2ivTcheUUdsFU3WorxEmi11T+gVs0XUGiP2VyhMU4wZ
	/Arj7uMd9fajIxcBwK4lI+TVDEmYe80vfLlIwmWE7
X-Received: by 2002:a05:6512:b9e:b0:5c1:5209:5a44 with SMTP id
 2adb3069b0e04-5c1c8239441mr192922e87.4.1795430874687; Mon, 23 Nov 2026
 02:47:54 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261123075219.369042-1-fuad.tabba@linux.dev> <20261123075219.369042-7-fuad.tabba@linux.dev>
 <20261123104553.20959-F-seiden@linux.ibm.com>
In-Reply-To: <20261123104553.20959-F-seiden@linux.ibm.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Mon, 23 Nov 2026 10:47:18 +0000
X-Gmail-Original-Message-ID: <CA+EHjTwSPZVSaHU9ABkLWDo3ic5cnK+qKAvHwFXkL-fo=0Sq1w@mail.gmail.com>
X-Gm-Features: Aa3M54oL2BJio-i_jjl1UatQuxbFZV0PJ4u8kL-K8TbxzfcAij-VPrnefcylYno
Message-ID: <CA+EHjTwSPZVSaHU9ABkLWDo3ic5cnK+qKAvHwFXkL-fo=0Sq1w@mail.gmail.com>
Subject: Re: [PATCH 6/9] arm64: sysreg: Reject an enum value not written at
 its field's width
To: Steffen Eiden <seiden@linux.ibm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Mark Brown <broonie@kernel.org>, Sascha Bischoff <Sascha.Bischoff@arm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Steffen,

On Mon, 23 Nov 2026 at 10:45, Steffen Eiden <seiden@linux.ibm.com> wrote:
>
> On Mon, Nov 23, 2026 at 07:52:16AM +0000, Fuad Tabba wrote:
> > The generator emits each enum value as written and doesn't check it
> > against the width of its field, so a value wider than the field defines
> > a constant the field can't hold. The duplicate value check compares the
> > strings as written, so 0b01 and 0b001 in the same field pass as distinct
> > values, and the rule's pattern, an unanchored /0b[01]+/, accepts 0b12
> > too.
> >
> > Require each value to be 0b followed by exactly as many binary digits as
> > its field has bits. The one enum written otherwise is TS, a two-bit
> > field of TRFCR_EL1 and TRFCR_EL2 whose values have four digits. Write
> > them with two digits, which leaves the numbers unchanged.
> >
> > Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
> > ---
> >  arch/arm64/tools/gen-sysreg.awk |  3 +++
> >  arch/arm64/tools/sysreg         | 14 +++++++-------
> >  2 files changed, 10 insertions(+), 7 deletions(-)
> >
>
> Lets split this patch into two:
>
> 1. Fix the bitwidth of the Enums
> 2. Add the new check to the awk script
>
> Then the fix is split apart from the enforcement.

Ack.

Thanks for the reviews!
/fuad
