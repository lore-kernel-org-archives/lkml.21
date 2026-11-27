Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795798662;
	b=Nj88by1xHOC0Hfgte7xt1LzTTCePOMc+iWRmS8VEj1iUYbRAtLdKpNIM8szpx1VRPn+l
	 uD8lxQ5JzZBSSL8sVRHnASA6OC6aMJeDRUm1cHW86/BTEs69FgHpqKEeDRlqfa6vZqV3d
	 C8rnWRvoOY+W388BJ0udD+xL1uvBLKwCnWxo9hnYEE+QVduAIayyZjhPwJQ2vZU8wSaoj
	 V5Uj5Sh3de15NNpVmLuBmho5nxDxvTLrjiO3slcxxhx92cAhDavOFfP9iUQr+cSnO5PfO
	 Hhs52n3AgDxoXBfJNJV3dkyDPxcco1PXlMprCBdg2bjNnv/Z0YBoEoHHs3l+iAucDmQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795798662;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=JoYlWYsc7qA+Bk9zv3r6KL/XVztnYAaVtmzSY0LmZ30=;
	b=MqBd4ZyLoIceXv0sc4vn9G5nuLd15NB734fgynKr+wb4O62J9P7NsRNqLDQ5W8yMxY+J
	 X7pS7Lv4GMShEZ5Cf65eHPynWnYRMsrF/F5BSUQNvQLqf/hKeekgaQK9dQGieoQNsweCk
	 w5a9QxJ97ObRLesFVBcO8RheRCrBQzCp6XSiw9X+carU998bAWROX4No3erJ5wK+58CF8
	 ab/u6TQ834z+y+tT2+jerPhZrI2DK9XzpaIvuS+bGikk6Kkd+5X21UwueS4Rc4iLM9vN8
	 CdV+agRnXCFFspTTD4dALN2NjWjA4+86op06TytkEuziPWgc7sZJzgQOHZI6ZCMaaPQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="f+CjY/BX";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.172
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D0EE606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 16:57:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D0EE606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f+CjY/BX
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-55c4e670fc6so62811961cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 08:57:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795798661; cv=none;
        d=google.com; s=arc-20260327;
        b=klkqPIRAmTCuwhdXwF8h10oOQYabYSoZlAGjGYVquuRjtjIbeoQU9jwwKbhiBfAjF9
         JCfaVAyil3/V4ZSa+C7oIR8manc2fI6emDlAVrM1rzfUgKnRWteJQ7WqqqO4zA1g6Oho
         daQjaZ2Tj7PgDENtM9RxjCUk8FqnJcHYv2OLrqUXwJ+hs/hq4aK1o6vPs3uJY4ElLeFc
         tq6C+hNFmzhjSc4S4jnQ9dau7CNol6/vckkLFLU8hP952HxElgTGnQPB0LA4VoQlKv/K
         350HsLruXoTDezHSx23WHrAn3iykbqqW9IZyEuZxYPlmYg7OR4aYXryr2EVYOt3t30j3
         pHxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=JoYlWYsc7qA+Bk9zv3r6KL/XVztnYAaVtmzSY0LmZ30=;
        fh=4fymApPmp1FstQ+LVaj4SBfis5tcNKIrH3SXAJykalA=;
        b=o2k1pzsaCa6qMdk2y3SoNi80dFwZiTT3MojhUdSEEeBve2oQez6v3u6Yh6am65bEF9
         rH9vlaxcAJFX1qlIE5dmDXmqlB7Ixsz2UJj58H2cn3mfTaOmLEHDWxO6W/7ygM1DCwde
         0MinEox+5QsY0SPU/Xg9h2+kOG3FWfxMMtDL/ZqGdemtv7rGzc2v0DgEvFOwupiOTqx2
         c/pM9SOX21+ATW+clvfTFqwQMN5+//Upc2n/EzHCMOdM5+XKsyyL/YMt2UO56W4AH4xx
         BGOVGbbDYaEaBfVwp4E5wnXTjPAIwvdrwL6mMcjB5FQYY+c7lwybSKD9JI59QxUQQ03B
         IsXg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795798661; x=1796403461; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JoYlWYsc7qA+Bk9zv3r6KL/XVztnYAaVtmzSY0LmZ30=;
        b=f+CjY/BXcpKl6jzX9OALdg1mfYorM8PIZRIjW5rU5+YXEtkDEecpk4tbM35O+h2l+Y
         3BySmVV+mW3zLErChy3JX8Fn4SNdfz8iDIA4tmhi5DY7Ki6vPLJIZlQNQrgRm+e7BiZd
         Dr45nSTD78QTB0+Gfx0Yfaf4hrdQNxxnzTAPR2jV1bMjf5ntnpwz9kaD04KIpjR0LYoy
         t5Ky+I4vi9mo4WJ8lucIof1Cx3aBixtmy2uew8gN82rbCeH7WFL4MYtu1i6S9NN1z6hf
         dQrP6ZJu+O/wvnlHDys73uhLW4+ve2adu9/IiRkeEDmKKWgUl7/St2Op+kUmSiTtTpf9
         B5xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795798661; x=1796403461;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JoYlWYsc7qA+Bk9zv3r6KL/XVztnYAaVtmzSY0LmZ30=;
        b=JgmIjQ/YJG6EZsNckWSiUzKo0nj0Ff751h9BWtDIEcq3/RLGF0b/Is8nQ1FIiTeU4t
         SeYnimyCYJwUE3DjzSinS51gy+Hp0hCa2GLTjnypD+5wAvsEN4rjB4EP3Sa8wmuPxZAM
         a3uTDhLgC8XCBtRBZjk1fHdsXb5gZKh7FFjuR6ektT007eDfvDlsPB1TxO9jJhmxzNwH
         bpkgjCfHDK6MQmmL5uxY5A5MqMdHytQJY/t1QSa0MEbf9xFB4XLY/ISfavYbC9MWRZDY
         4HHqhgebbSwK4F1DWUb4UvXe+K6ua85caCTZlsN5aVj1sSjo+j7rFXNgBKgE0/G/I1ZT
         PMxw==
X-Forwarded-Encrypted: i=1; AL+hErGeQo6oszYndRBN43dQZ5ZqSs5L6pRUAnAPtjs7XKbGOQtSrN/k3XV3xB2LWGtcBvNXwyQ55VZV5WbQwlw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8WT0MZiaqdjiX1YWRqhN1VE5t8YmJMFWoQfProeabPVDwZ9GFy
	15ST6kC3AehyhNjCuEmItGcRbrlgX13GSD1EgrD+FeXwwjbb1L8MGZb3W3va4H3eiUt0aLdKQzJ
	2iIKujGhp4uIFcSTXfaqip9cm2otfD0g=
X-Gm-Gg: AZFdTZeusDKOOMxsE4RTcrH81tyCgqvk2K4Khe6qxMwirCGqyqyJ/Gy0dg1bb8u0qVc
	mzRzLTXthyuYZntb1ZzIvF4xYFqfwjwsbDNrB6e4+T+7BaeySagI7+Gv4C7pH2psX/cBNIZh8A1
	+CNnhRfgCybOYrPbOMCL6xLreCmkA9AtPp/mxeZxi40YoNxkVY0iuqWbm5r4+W+6PO00PQsBRUO
	TCFX7EeEBcxr/wFbLhReEEVucJCI7RQijUc+Q1DOjU2ZP3HsslfGVe8mnZgaMF4wXl5CfvzCKLM
	NF0ui1v5ywMXBX5WtV5PniVkzQTtORz5T1dhqgh1qcWYLeQZ8PDYDGvcsktyuiDuU5VH39ozwRz
	75ppPnNSLqih0vPX4vY6j2PGXonSpm/o3Hq+sR1HZyznK4Onsoay+q7YWXzm+yCzjKus=
X-Received: by 2002:a05:622a:5a1b:b0:535:384d:68ac with SMTP id
 d75a77b69052e-55d769e9f2bmr449322421cf.13.1795798661145; Fri, 27 Nov 2026
 08:57:41 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261127134507.125513-1-hikmahgumelar@gmail.com>
 <LKFsWplUk1yOr4M1dEHqZ20-Oo7ya-QA5qkF8u2lcfPUsbJYq0AoJhyjIEBwg6PPzlPSMYfqn6CB-sQBOuQDKQ==@protonmail.internalid>
 <20261127134507.125513-2-hikmahgumelar@gmail.com> <a8ee91a3-fc4c-4268-97c1-b4ddeff2558f@kernel.org>
In-Reply-To: <a8ee91a3-fc4c-4268-97c1-b4ddeff2558f@kernel.org>
From: Hikmah Gumelar <hikmahgumelar@gmail.com>
Date: Fri, 27 Nov 2026 23:57:29 +0700
X-Gm-Features: Aa3M54oyapQeOF2CNR5heqj_kowOsQNp9ESIWcAwgObVTh4Yt2mT_qD_BbMY_SI
Message-ID: <CADA=zOPBRrzdST4rwNwejXF9cY8XJUFMXc=+FR5AQMiFFdKPBA@mail.gmail.com>
Subject: Re: [PATCH v5 1/7] clk: qcom: gcc-msm8953: fix csi_phytimer_clk_src
 100MHz parent
To: "Bryan O'Donoghue" <bod@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, Abel Vesa <abelvesa@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Bryan,

Thanks for the review and the clear feedback on the commit message.

I will keep "leaving gcc_camss_csi0phytimer_clk stuck off" and drop the
board-specific reference at the end. For the rationale, I will note that
comparing drivers/clk/qcom/gcc-msm8953.c with similar Qualcomm GCC
drivers such as drivers/clk/qcom/gcc-msm8939.c, along with testing on
MSM8953 hardware (my Xiaomi Mi A1), shows that switching the 100 MHz
parent to P_GPLL0 with a divider of 8 resolves the issue.

Best regards,
Hikmah Gumelar

Pada Jum, 27 Nov 2026 pukul 23.11 Bryan O'Donoghue <bod@kernel.org> menulis:
>
> On 27/11/2026 13:45, Hikmah Gumelar wrote:
> > The 100 MHz entry in ftbl_csi_phytimer_clk_src selects P_GPLL0_DIV2
> >
> > with a divider of 4, leaving gcc_camss_csi0phytimer_clk stuck off on
>
> "stuck at on" or "stuck at off"
>
> > MSM8953 platforms such as Xiaomi Mi A1 (tissot).
>
> ah I see.
>
> "leaving gcc_camss_csi0phytimer_clk stuck off" you can drop the fragment
>
> "MSM8953 platforms such as Xiaomi Mi A1 (tissot)."
>
> > Switch the 100 MHz parent to P_GPLL0 with a divider of 8.
>
> What is the data-source you used for this change ? You should describe
> how you know this to be a correct change - the code is simple and
> describes its own change.
>
> For example citing drivers/clk/qcom/gcc-msm8953.c and
> drivers/clk/qcom/gcc-msm8939.c since they are very similar controllers
> and the 8939 does it the way you describe below. Also "it works" is
> another good reason. Inferred from your patch but not stated.
>
> More accuracy is required here.
>
> >
> > Fixes: 9bb6cfc3c77e ("clk: qcom: Add Global Clock Controller driver for MSM8953")
> > Signed-off-by: Hikmah Gumelar<hikmahgumelar@gmail.com>
> > ---
> >   drivers/clk/qcom/gcc-msm8953.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/clk/qcom/gcc-msm8953.c b/drivers/clk/qcom/gcc-msm8953.c
> > index 8fe1d3e42144..8aec5600e837 100644
> > --- a/drivers/clk/qcom/gcc-msm8953.c
> > +++ b/drivers/clk/qcom/gcc-msm8953.c
> > @@ -964,7 +964,7 @@ static struct clk_rcg2 csi2p_clk_src = {
> >   };
> >
> >   static const struct freq_tbl ftbl_csi_phytimer_clk_src[] = {
> > -     F(100000000, P_GPLL0_DIV2, 4, 0, 0),
> > +     F(100000000, P_GPLL0, 8, 0, 0),
> >       F(200000000, P_GPLL0, 4, 0, 0),
>
>


-- 
Best regards,
Hikmah Gumelar
