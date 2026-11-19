Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795102697;
	b=XRh0uuyWOignGryBYYuRPeWLXiGDG5jchlpvl+qofg+TwUV6YesmA1w+324S2omDgJFY
	 9TbIsbM6cjgkBQ/yFIU82tCfHUOV4+pxsUWv3T04PodtQYaLeS1wkk1EjpaBgDZKQUXRj
	 oFYtkXnB6LyKs7V8dVLUPKsY0X69ZmG0RYs07NCnr/lX2sGXAWb5bh0gquIoEhwNVX/64
	 XEXvbISS09VAZV8UzYUMgzMY3+2WGYV2SEAxvb8LSafH2YV+WkaEyGD8pOW1/36wuTwqb
	 JcEY2RBgOglHntFjzE7dDdsJf0MEa96gLhDzF+jSRfnCozHzmgCPXpEEqO7a2ysI3Rw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795102697;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=drywv9X/QD6GTy9pDjLa5PABODeuHIP48aMyKh24UjM=;
	b=m09xymXh8tIft6Cg8hYiQLOxj1PU8+TD5LB9hdBz80wU9YgYcWV6WwQpbeKly6aGzgfd
	 S7XX/1qVr5hm7ozNWwrexeoeE3BZjflVgN/mH6KGrY1XZOkRlM88TXG7e0hRqE7Ag1QVa
	 Ux3KQNTf0R06d9hTRsH7eQX1vjicUd/UQdGanpKr2olI7VFgc42DXZ6uajHOnOw1jBsTs
	 iFasJds8Us9FPyirjT5o81K2FYsZdJD/uKi3P1rZ7lrcmvxTWT5mCKDuMtcmg0gXH8QUS
	 P8ekN5WttFOyApQBnI7bV6EE7lLus5us5iymbOp5Cvx60a1CjPvKxMOtXE02Lrh6MVQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=brainfault.org;
	spf=none smtp.mailfrom=brainfault.org;
	dkim=pass header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=l9wqPPh5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86CB460A2624
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 15:38:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86CB460A2624
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=l9wqPPh5
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-492690dd5daso2048933f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 07:38:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795102693; cv=none;
        d=google.com; s=arc-20260327;
        b=J2vrHjRbq00SqFoqJOIqq+KiOu2Se+bYiCE7vpLjnd7pDW0tXxV+Av4OxU3XVW8XtK
         3d80GvyoqVfq5szh/HMgPJJZesWjpCtEKeULqcUg+/Ha6lpmojJBQabSTjAiYxPzpa/j
         Rs1L6ilsYIeOfWwwYXDiw5eqFLFcicw5VG9ujFn4lzT8qdh+yJOGIGvJJ3PXAQoaTIj8
         yqiXeugfB28Oc0KDqsWemOvlOYc+6eN8VFgseG53O/JMijQK7BDHBRgn1RdTa6KsWO3J
         EYXuB/r8l4qUalRhWllqERsPkNWX00jFYe3WX5PqoU8hhwmyGfu0iecvAOPcooP85iCR
         Gugg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=drywv9X/QD6GTy9pDjLa5PABODeuHIP48aMyKh24UjM=;
        fh=bUIjUN4YnwNDciJRqMkKgfDjWR761jkyjPVMCPz/vD0=;
        b=dd7Gj+7u+zy2k0JsxlpViHVCTeBlWA6WI9cEHJf2lMZsSWEB9RXDBq04d3jG75Ilcq
         C1Xobx7bYi2o1DMsXJHtHu9dMIXjmD5p/vgCxBfQ+jLHf+TyatY9eGxVqdKUDLtfao7t
         gSeqkPm3D5SvR/nA6yXn+AdZJoT607PDCS3Vgrk6YIJDiefwuqTvumaDy5Y+99vBM0Uk
         3wekniDZMq1zUIj0CJ685RI92ba+GmW4UrmV1kGJxKgzU2K3WLZbWBtjaJ0BAjZDJAmk
         T0hCntZVkuBfKmmLYWyagX1q9YGfF7eJwo9uOiksLMzQZGmsDqqzc+dOj7Gpw5bSsvIp
         2gxA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1795102693; x=1795707493; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=drywv9X/QD6GTy9pDjLa5PABODeuHIP48aMyKh24UjM=;
        b=l9wqPPh5HAOPk4NvNfOoXCp9UFZt0jF4fJuFzlhGeawYtptb+gtWbzOsk933HOggcV
         gmrWI40zgGAVf0b2Rc4WuSWSxmqNANkfDkkQ8pMG0CjWEER+nI5FHtMkKixmM+9lkucI
         g3gMbdKtaU8mAkgC/MxW6muRBq27+stByNyKvhaqUsvnVfuISB8/r8YexQ+PeMrcncvM
         vQZRiRm1uTB1Gvgkogdwdaw7Vc1Trjj/d1iulvsvNKXFE9cntCxgMvnRZZUN/z+dLJCU
         9478GoyQiTkG7QDOI+ATjIQqiYR4wh41NerHKnqzQYvskYfHCSBPBqeDZ5YJZ/jALlde
         gRHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795102693; x=1795707493;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=drywv9X/QD6GTy9pDjLa5PABODeuHIP48aMyKh24UjM=;
        b=RIcZILXx07ZKqLEPZow/cXYkOB0ef/ORV3cErPlWi1Acnmv6Wp/CCed3gD++jH73+N
         NYRpor869tUpUTwO0UTtlwc2hqVnGXzruadLlskqtDhwBdkssRriV8UThSTlrRhgpxXg
         3lbfonUEdbC7cREaDFsr62PNX5DHwp5bAz5adLASa5Jcq8SoZogV6iHQ86jZQZTisua5
         Ec9Rr0QmJ3JjpQTcR62dbspQfUchaq0Cp4ziczzV3RHMfl4tmoVe8GtElm7O/i1ehiB7
         Qj6fwln8LS8u4KxLaNaASaiNFiYtHVQ81pb6SLsecSpMRELCKlGZ5z7RmcofL/eiL5i2
         kmJw==
X-Forwarded-Encrypted: i=1; AL+hErFj8qDmLu8Skjc+jLNnoFey607gBEhtMo77afyx9nhA90oB/+2HFcyJ+61+1qO7xOZrJUe2DSCorJG+0Dw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Bank6i6+/MuiHON7z3dVkqRXRpMU4uLKd16kU9HSu/Js6FwfJ
	inGhdUw+bbC0rQx8wumQquma5Hu/iJcipxPkJIEA9PfSUDzK4OEXjrJEuUf9PQOa3x2UDUMUKdG
	lrl0zARmOmiL5TI8aHhX3qNSsS0+tm3oRS/7w34hFUw==
X-Gm-Gg: AZFdTZe6FJhuChfzzxNnJpmM/3sFwe88SQ9Vp6vxuMy4kDG6j5Z9pKytCzvv3PcKUD9
	53j4zwqd6XqWqGHLuarBFo1E2SuEzBIFZ4iYKrLSEjI+EOYyv8aW25RdatCnQXfBnWJpuV47nDg
	PcejMTlIC5F6zEnFBX3Ra6IoAY5EEe3tmnRsszOIR3fWSPz/m4u4b1uEjOtw0OLlmPHw35TwWnD
	k7UYNfdyRUv2YitJMufZ7gil/ns3Un6/r6or5Z+i+Y/nWRTO7fJ4t31OUeYGJInWI9V/XeFQOlP
	YFlEMdJ2d8F5VmRMuP32xn9irpbdZydhXm6oCF3TVsuTrOq3QWjR4Evjk6BN8GT5H8fjqB83hSv
	kYWVqZ9tcqkn76GhR3wGjxRBuyyzTKu8DHAHel/DC+uHr4sKaupMsYkLg1pRq0MX0Apuihb7CEN
	nwXT8l8E6ryc4P/zYozRGBGI3ostoKs9be2vzHvjdUyLwwYmjH3KHtNSmN
X-Received: by 2002:adf:e009:0:20b0:490:1881:80ec with SMTP id
 ffacd0b85a97d-4a63a895742mr10073341f8f.36.1795102692730; Thu, 19 Nov 2026
 07:38:12 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118095053.3871267-1-vikram.singh3@oss.qualcomm.com> <20261118095053.3871267-8-vikram.singh3@oss.qualcomm.com>
In-Reply-To: <20261118095053.3871267-8-vikram.singh3@oss.qualcomm.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 19 Nov 2026 21:08:01 +0530
X-Gm-Features: Aa3M54qqVopLHoNkItX81APze_rfhpoAK0QlJ8DY6gdjSieSVn8liCJp7Smx0no
Message-ID: <CAAhSdy3KUqSqERnw6khG13mXKcaCf3UeG+FqQAZzeeNZ7S7GfQ@mail.gmail.com>
Subject: Re: [PATCH v5 7/7] dt-bindings: riscv: add Sxctr ISA extension description
To: Vikram Singh <vikram.singh3@oss.qualcomm.com>
Cc: peterz@infradead.org, mingo@redhat.com, acme@kernel.org, 
	namhyung@kernel.org, mark.rutland@arm.com, alexander.shishkin@linux.intel.com, 
	jolsa@kernel.org, irogers@google.com, adrian.hunter@intel.com, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, atishp@rivosinc.com, anup.patel@oss.qualcomm.com, 
	will@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	beeman@rivosinc.com, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, Conor Dooley <conor@kernel.org>, 
	devicetree@vger.kernel.org, Rajnesh Kanwal <rajnesh.kanwal49@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2026 at 3:21=E2=80=AFPM Vikram Singh
<vikram.singh3@oss.qualcomm.com> wrote:
>
> Add the S[m|s]ctr ISA extension description.
>
> Co-developed-by: Rajnesh Kanwal <rajnesh.kanwal49@gmail.com>
> Signed-off-by: Rajnesh Kanwal <rajnesh.kanwal49@gmail.com>
> Signed-off-by: Vikram Singh <vikram.singh3@oss.qualcomm.com>
> Link: https://lore.kernel.org/r/20261106173942.3175069-8-vikram.singh3@os=
s.qualcomm.com
> Signed-off-by: Anup Patel <anup@brainfault.org>

As mentioned in PATCH1, drop the "Link:" and the subsequent
"Signed-off-by:" lines.

> ---
>  .../devicetree/bindings/riscv/extensions.yaml | 29 +++++++++++++++++++
>  1 file changed, 29 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Do=
cumentation/devicetree/bindings/riscv/extensions.yaml
> index 79491ef8f86a..dde2f28cfda5 100644
> --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> @@ -202,6 +202,13 @@ properties:
>              mechanism in M-mode as ratified in the 20240326 version of t=
he
>              privileged ISA specification.
>
> +        - const: smctr
> +          description: |
> +            The standard Smctr supervisor-level extension for the machin=
e mode
> +            to enable recording limited branch history in a register-acc=
essible
> +            internal core storage as ratified at commit 9c87013 ("Merge =
pull
> +            request #44 from riscv/issue-42-fix") of riscv-control-trans=
fer-records.
> +
>          - const: smmpm
>            description: |
>              The standard Smmpm extension for M-mode pointer masking as
> @@ -263,6 +270,13 @@ properties:
>              mechanism in S-mode as ratified in the 20240326 version of t=
he
>              privileged ISA specification.
>
> +        - const: ssctr
> +          description: |
> +            The standard Ssctr supervisor-level extension for recording =
limited
> +            branch history in a register-accessible internal core storag=
e as
> +            ratified at commit 9c87013 ("Merge pull request #44 from
> +            riscv/issue-42-fix") of riscv-control-transfer-records.
> +
>          - const: ssnpm
>            description: |
>              The standard Ssnpm extension for next-mode pointer masking a=
s
> @@ -1189,6 +1203,21 @@ properties:
>              - contains:
>                  const: zicntr
>
> +      # Smctr depends on Sscsrind
> +      - if:
> +          contains:
> +            const: smctr
> +        then:
> +          contains:
> +            const: sscsrind
> +      # Ssctr depends on Sscsrind
> +      - if:
> +          contains:
> +            const: ssctr
> +        then:
> +          contains:
> +            const: sscsrind
> +
>  allOf:
>    # Zcf extension does not exist on rv64
>    - if:
> --
> 2.43.0
>

Otherwise, LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup
