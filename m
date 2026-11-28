Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795870044;
	b=3fkwxsY3ndk48bo69H0hQnFKPYURXKvl9vd41wvTD7mVXCj/To08Vz5p2kQV9JaTT6+K
	 GJSn3ThpEMwMzNqY11405GcC5CAe4WqQFSJ6xu7gBAiE5F6SBbvbkhpndJkXTHZbfqJZl
	 i1Jo7yRokrKtjUDtrBoOAWwfXHERW3GaKScoO8edntbbozpiAk9Z4qQFfx5YIpG4eeODm
	 UmK/MKNYIPJT4I5mNj4NWlEP/ZMMRto+qtbnNf8vgtXAssymZCNyXu2c8O1TkX11/Cvzs
	 tIKfYICnKQOHmwWKWhm9+oSiFyyUw/bAuX8IqZ7KU3vCRXRCZoRwIsRpGQHQhZpCCmA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795870044;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=rYecEGH2/8QLU6ICTjxFNFwVGEvUl5Te2zyk3KgiCIA=;
	b=HUnsKUvT5c7BfY7DGnQRYxXFB95HX5czLR3fhV4JJe3FEcODV1QGrFKqev1DvjvGH1cA
	 lYVWpE4IcSH86PFlpJ1T/dM3nrsaNpYDrNKWxY8x0TEcS/X60DBmGVNidTX6w7NyCovbv
	 QC+D9Al4NLDJj+t9fM4Fc3cbB2MhPBmO0AxjYNVkS9NBOGkF6I9WsF8vakNlET6CnB+Cd
	 1w4yLIoPtONPQZpeB1p2K9GOnO56BGgu+HIreDPLgNolX7OLZGPNc71sMhNN7cfDTV5q5
	 WOB8ErUoITS8gJL0lv6tSsrsPoT7E1ZYTSmc6qwUAwC7Ht+Y1hl/zRy26yAX+l+vXKw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=tomeuvizoso.net;
	spf=pass smtp.mailfrom=tomeuvizoso.net;
	dkim=pass header.d=tomeuvizoso-net.20260707.gappssmtp.com header.i=@tomeuvizoso-net.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=BeILgea6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.180
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 484E1606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 12:47:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 484E1606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tomeuvizoso-net.20260707.gappssmtp.com header.i=@tomeuvizoso-net.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=BeILgea6
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-94965745d92so880842985a.2
        for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 04:47:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795870042; cv=none;
        d=google.com; s=arc-20260327;
        b=g4CR2esSsCWW3psqBOcSWEWDGPPxXf7XttDHUr1UNjMayycnr9vZfJMrF+9raLjTWU
         eY0cXyplkjw6UoqH+dqNsSS1DaanrhVmm3nPbDpKVZIJqq4lP4XzIf/8Y65q5H6DZu3/
         49/4gONhmjBXeX3urQj3JrH23QOaUaTyipc0siQp5auraIl7gdps7DrXVPcUxHhCfCSW
         rg+5BPi6kc10YUg9aJOybtxaXaxpBn8KdaDgOO8cgsBZPzkE3Jot3assP9+9H1RLDlo/
         UVqngkrFSKIvpA8nKn/JZUo2QUSUfUAZBM+2zltPpHJaSqhaC9ztmKOOJ4RmjJXRRFBe
         tBEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rYecEGH2/8QLU6ICTjxFNFwVGEvUl5Te2zyk3KgiCIA=;
        fh=aDqgsiSK12pakoJ4YR/zesND7aPFhNpfQjcjSNo8Rwo=;
        b=LLBopRKM2ytt1PqTjmsCXZ4uyZbKkts9soWdLZFUZUNC6aui7WlvnOyUoVnqCZCTqS
         IsTPIm4WH1DTvtV0u7pmNYpb+7nfr8wuaj5uODHl6fYzmo+JrG/Y9jCWmkT12B/S91wJ
         zg60lrWT5HlUbF3n1xQWjq+vRMG6njjcvVY1lD6Te2wiUTFT6o4ernOYPd3HTy2S40LH
         6i8YryvNj+QavJXi24PMhJN3JBmcfdt/tAoVZ9aEv1JBUaxB7cibvsJZavCz+Fn3Zq/B
         ISB9TUMvC/ox/Y29WNaznS1PSPIpbO5Y7OWsBPP/FfzNNeliP8iO9bbeIqD7mN0Zy9V5
         JCPw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tomeuvizoso-net.20260707.gappssmtp.com; s=20260707; t=1795870042; x=1796474842; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rYecEGH2/8QLU6ICTjxFNFwVGEvUl5Te2zyk3KgiCIA=;
        b=BeILgea6h6Wg8RaehQvjTj8f0K9g12bAmgGs/XFxkw7J6G34pnn6kCTfXx/5VP73om
         OHUhNTPxJOoZdWHMgfRtiDdDn+jvsRXPh/Q9GoNot5kFOpeHEUUJZN5lbu++iOQPzzyt
         WRvJod3QyNB7FkxvZ+M2TVdW4yHfv/ygPzmnyK92F4G0XzUKoY4fzxvfqM7zgH3sDATT
         fRdTntp3geFBYiCkDqakDR0JCM/TSg8WUOcHsAdl3YT3Kq6JRLg0Kyqi208aDXSfDdxO
         n7JTQtplfyAVYeDMpLyam00amRGOmMizjQM1tvsa7UWIOlGmxSB3Npv84mfTGmBPr+fa
         53bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795870042; x=1796474842;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rYecEGH2/8QLU6ICTjxFNFwVGEvUl5Te2zyk3KgiCIA=;
        b=wAlIrBfz7BlYY2qU7H0+1HZu58jkvrRdbURlwX41dpcfPrGx+bRziYIwKwbxf3tccH
         Gt56HIpFw8YJqIy+jqTtUAIaoNm8pGcbEhAvkN0tW0kn7g9ZYmeFWRxqwqI59mPEP7kG
         xw4jjsQ/wcr7p761J5VJp0vSklH1mj//JSEn7DV33KX5QCFSIEb7gUQ94ASAq2fA6uMx
         HmU52wrRDlH/wJn0q54RwEpUXEhWesXs98UpnNUTo/rF5q+7tYLh+fieIwAFmpbCE37O
         gY6jU/KEwpM7a+paROoMkXBL/5Rbipw4HZP3FcXLydQrwiMZvXOC1RrW+YHFnsHuKrUr
         Y8cA==
X-Forwarded-Encrypted: i=1; AL+hErGCCUbHRhXAa6URD1kM5PdpuFnk/I20M7r2E3jPiJKqcmGfY76rTHrVJRbcXA/NjrLhBOxsS/B3tgOc6Ng=@vger.kernel.org
X-Gm-Message-State: APuU4Z92kqkMQYnqURRxA4xbYsJtGlE4UzHoCoFi250yLQRpul6/PPxm
	Ssiqnruh1IUjSdvS3RaCOQD/v5vZ4J0Snd4vAqubrKkjbH4jTp/lspz9vxtMxEyMSfpWurBeWKS
	FgPf8xSsbUhoZI3M0N0PKr43aNJtNj00uQpyoGLaOnA==
X-Gm-Gg: AZFdTZd4MWpJK1vWrhXrflARNCwdmu2vWDokFaT8h4Oiw/qN+ECeeqY3zb73C4tU7cr
	dSQ9IchJ+SSRdt5ANMALtSTTxHICCGvhZnpevI28y6DiyoHCWtOqKabsc3Q648GRlUb4P5Ci0+J
	2HAQcujFODd9/K1YR5KBCXYq83r7f745YRNcOOu8bAx3svSLtjnHYLjDOb/bJ9YW+bk30SaihwF
	CSTq8B0npMx4Kw6wBzoPMKfriTt2nQO3vDgFmgvAzd44WvyzPtxu7SFzK7lH1h8PIc6okcpAPQB
	weLPxS+GRqBF3adiYiXjbMkSs4UMB63h6+/x/MeQJIOvAggcTiI5C15mtOmRZezxgOqtxzfiF+X
	N3HtDEcEHLGYh3n+RSWqx+ZMNlnVyhShEaYldVRrPHkEIzXD8qYe5Jq+3IL1H2LEm6S7wbGluLj
	2RzPJD8+R2yqybxY5Mmns=
X-Received: by 2002:a05:620a:2685:b0:945:c4b9:3de2 with SMTP id
 af79cd13be357-949bab3e44bmr4797027885a.73.1795870042110; Sat, 28 Nov 2026
 04:47:22 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261120-ethosu-fixes-v5-0-52d459acdb84@kernel.org> <20261120-ethosu-fixes-v5-8-52d459acdb84@kernel.org>
In-Reply-To: <20261120-ethosu-fixes-v5-8-52d459acdb84@kernel.org>
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Sat, 28 Nov 2026 13:47:11 +0100
X-Gm-Features: Aa3M54qpbAQbDlEgPyrcTk_PogN89shWh1HvSZaSgocnlIamF2kUnd8sMgtnawg
Message-ID: <CAPsqS2RB-Dejz+L6joynr6DmbXE9nyADOAutwWCsT2hiKedWkg@mail.gmail.com>
Subject: Re: [PATCH v5 08/19] accel: ethosu: Validate all feature map tiles
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Oded Gabbay <ogabbay@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Rob,

On Fri, Nov 20, 2026 at 3:58=E2=80=AFPM Rob Herring (Arm) <robh@kernel.org>=
 wrote:
>
> The command-stream validator checked only the final feature-map
> coordinate. For tiled tensors, this can leave an earlier tile base
> address unchecked even though the operation accesses it.
>
> Check the final coordinate of every tile touched by an operation. Also
> treat U65 feature maps as 2x2 tiled: its precision rounding bits are not
> the U85 storage encoding.
>
> Fixes: 5a5e9c0228e6 ("accel: Add Arm Ethos-U NPU driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
> v5:
>  - No changes.
>
> v4:
>  - NHCWB16 feature maps may be vertically tiled. Account for tile 0's
>    maximum Y coordinate when calculating the feature map bounds.
>
> v3:
>  - Fix for storage mode 0 intermediate tile calculations
>
> v2:
>  - no changes
> ---
>  drivers/accel/ethosu/ethosu_gem.c | 147 ++++++++++++++++++++++++++++++--=
------
>  1 file changed, 119 insertions(+), 28 deletions(-)
>
> diff --git a/drivers/accel/ethosu/ethosu_gem.c b/drivers/accel/ethosu/eth=
osu_gem.c
> index 9a66d8439408..11f41382dc5d 100644
> --- a/drivers/accel/ethosu/ethosu_gem.c
> +++ b/drivers/accel/ethosu/ethosu_gem.c
> @@ -444,6 +444,96 @@ static u64 feat_matrix_length(struct ethosu_device *=
edev,
>         return addr;
>  }
>
> +static int feat_matrix_check_location(struct ethosu_device *edev,
> +                                     struct ethosu_validated_cmdstream_i=
nfo *info,
> +                                     struct cmd_state *st, struct feat_m=
atrix *fm,
> +                                     enum feat_matrix_type type, u32 x, =
u32 y,
> +                                     u32 c, bool ofm, u64 *max_len)
> +{
> +       u64 len;
> +
> +       len =3D feat_matrix_length(edev, info, st, fm, type, x, y, c, ofm=
);
> +       if (len =3D=3D U64_MAX)
> +               return -EINVAL;
> +
> +       *max_len =3D max(*max_len, len);
> +       return 0;
> +}
> +
> +static int feat_matrix_size(struct ethosu_device *edev,
> +                           struct ethosu_validated_cmdstream_info *info,
> +                           struct cmd_state *st, struct feat_matrix *fm,
> +                           enum feat_matrix_type type,
> +                           u32 x, u32 y, u32 c, bool ofm, u64 *max_len)
> +{
> +     u32 storage =3D ethosu_is_u65(edev) ? 0 : fm->precision >> 14;

Not something this patch introduces, but an OFM with storage none (3)
ends in the default case of feat_matrix_length() and is rejected. The
U85 TRM (3.6.5, write_ofm) allows it: nothing is written and the result
stays in the accumulator. Vela uses it when it splits an operator over
several operations. Could it be handled like chained storage?

Future optimizations in Mesa will need this fixed.

Thanks,

Tomeu
