Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795416165;
	b=a3bEBh+YC0T5uFOZfXdrF+HK6hhKlwpyOf/rZ+HFh9lnKOfU6jP2aiUz/Y4qsn27bRE5
	 0Su4YBQBVmugoaWfyi4tuRLYBA9XVCtc5aJdC3dRTHCyCimPpCFQeOnw3uwQBjOtCA7M6
	 F4STU5M0RwOD1DvfeGyx6IxBuRuqiUpV91BmLgowkF9GysHa70XraZRi45ly77mO43BBm
	 e+lAiuTtgo6zxszYNpjvefL3qm/a86WlvjPblGRxvGm/2OSij6dGkwsmaSM6gJG+k/tbk
	 8gCng/JLyO77ZDeNz0fB/L+wFYfTi8orFuFkgMaZ2i7oSPkLhKnmdXumGjwQHo3lItQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795416165;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=naTtgcRj/MertQfpVKpr5lkSMEaf2WtEA0kcdQKCaus=;
	b=G9uIj54g6ggragBNQWzW5STRBeJ/VUjkTie1HijtJFB7OOrtFhCi0cWrNC9cLvSt448b
	 Myo12jaVwhFhuO75b3HYU94h5ntG15t47zlD83uUZRfmj/EpqrQqObKEMI2V2yIwjEK/m
	 qKpLOFalDmNKEhX91zlWDGyTp7F4/AK1pXuMAV7orslxDpPxKoB7qGaM5B4k9pUmKeOQp
	 +YJ35G5U2+9GvqviwZ1sD1QFrt5TFgr9WleNAXicm7I6l0WSv3lZktHgTAbvZxVrY9wHs
	 zw/0aURJDvRrs9rlsNOEtw73pslDfIHzaxbNu6PcrpnjteUXGYOvJLjjjGwExeTSt6A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ScVPpVXT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.41
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6419606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 06:42:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6419606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ScVPpVXT
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-67db1f6f50eso2907585d50.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 22:42:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795416164; cv=none;
        d=google.com; s=arc-20260327;
        b=ewHfGOQHa++7cyGSmL36xScyuPiQOzuW1uUYja0hj8wZlTs7Ug+2Po1AQ2It3wFyjo
         rEZ2dPEOOmqw4Nr669gYk4VLYJ+6fTzXSHIRr1sSkqI07seXolZd4RpuJs1LX/XowTLT
         AwPBeHrRjoq7PeukCUTySpGce199tLJnTEewRkrjNbMPdBjelDjdOFuPLPI3+SYeAGbb
         3jY/odbPFwMphIjk5627Q3PVyT71V+RhDRXMxLa1iVC7y9S+BBfSu4GiKdHjgpdOs843
         feWLj2oA3xeZh2mnYa2wtRLduwKgGYTsop1odudnxLtTSaRBR9wX5QBclyi/3vpd1uYM
         1ciA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=naTtgcRj/MertQfpVKpr5lkSMEaf2WtEA0kcdQKCaus=;
        fh=3piNZ+66mH8l+132tRexbJ6uXiqpKmSyyt+2m+Wnb5E=;
        b=R9HZMDlEZ4YPfmVBQb63aJEhTGX5tRhbqwayYJ/c9G7b3GgbYPL01IwjDYLa0CXako
         YaXKABPZe/GGr1SrA/TJbFTm/WJ0QORCrvouo2p9ih8ynNBL5Dbv78AfaDOoGWYLHHAk
         sHP9kFqWJgqJ9rr4PycJ36nNw1RjPYTCvkxVb418Om3Ddwa23usAZcOht2SCEoVnd/cG
         N3vQSI3kVx0TLddCBj/oanu3hXKrinvXIa+2TMYHl9DAHd5n8yHWuhpa8tmFThHeuOrF
         VrCheMKmpNTpGbiACrCmG/Ap1OjC9ROdmeeB9ImUrpQcfmo/UzE5F2ZjBylXBhQlnFBj
         VNfw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795416164; x=1796020964; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=naTtgcRj/MertQfpVKpr5lkSMEaf2WtEA0kcdQKCaus=;
        b=ScVPpVXTZPlEkXMOVmOrpFrbcx18M4yy08hKdSrknGePgEsA0KYlK1JTjkk8liiJLi
         en8EFA/UOSUydUn7tdFUr0OTU53c8TrzHtfc7GJjHfLX4Ohd6yADP8zoasW3nR5u+PZq
         yi2p9rTbYLEFcbTnKsp7Phu5W6LA/kca/ozPA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795416164; x=1796020964;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=naTtgcRj/MertQfpVKpr5lkSMEaf2WtEA0kcdQKCaus=;
        b=whGjXU00eyZl5KRJKYqIWxgSU0wmZH1d9WXlNHBbCerggVWqU3pmDYGfs9yMt7C7JP
         o6yt7Vaq0/cOa9lH6CC50fyC0QKPNvh8OXgI9ufhvMTWsGJ9ZNKRxw1DCcP6rLZ0IGT5
         /cnO/zlPBp101wr6Vl1nXzmt0zDWHQFckPy05ZeR8GafJDLj9mKAYHJFXJNqeeCGF7j8
         KKCrw/bPh7JRbB5cpcaEFH7Nob199RhKzeO106tFX/2Dh0Uz5z8hGUSWcvo3DJLM/z73
         98pL/bjbl26rqDx/pn0Q/ZbWid1TQZ8Ll7X+ja4geKdcq225d++b6Rwrag4aUudAfS0K
         GtzA==
X-Forwarded-Encrypted: i=1; AL+hErFd1SqaXAf1s7A526+XyVP0L3qGZhHr9LLgkaixqkVsbtKsW829gdAhAK/9GB6u8YG5cbBHyskxNdvLAew=@vger.kernel.org
X-Gm-Message-State: APuU4Z+PaCxWL4GY1d/SPviZ22pXxKOW9V56T4HHQe86ys0I3zz095pX
	3NN9/4JGMXEpyg4XXIWtIZiYqcMlBJKeYuv0K/FwbXD2CPSNVhzFBNleKznubmnvfFSOmy8LKje
	7khj+LCStDLQfA9E4NzpXBt5ZoLhfE+O7hKXQxZ9d
X-Gm-Gg: AZFdTZeLD9GSQo5eDjAFw7jiz8kYar6XtoZjePMnRIryjhcqEIeCpG2QahNKJVUSJ7M
	64lN3WfpskrxVqQg5ZYEdDCZ5YFIoyIP/PLoSvoEHH5WB+Z4tswyNoKmSIPt9Lw5jCh6S+Il5pd
	pPEP0dS/bKQMEzGXq3nv++wr0CGthlETtqiDcjOOws5QCTGRTwzSF2l/I3BbUbolg1oGvnFzQoI
	KOcuIW/8jb0jiN01JFLtQGxteWonA70Pof5PNO3OYUltXaaz84t8hlCrLCEpy+TMBNkXVn/FWYr
	ViiIm/iEOen/WnxtL+B3qzLw1RxpcaEAT4lhtWuh+18i3IVaDNOzE+u2hsYeLB6ayZ4lTJRu8Nv
	gra3wILP0lvOKzQ9imYVnaC6YdqxSmRv35uOhCVgLz3wv56ZKatJQyvHWaGafpcUTYI0=
X-Received: by 2002:a05:690c:9c02:b0:8b2:bb94:8cb2 with SMTP id
 00721157ae682-8b5204ac257mr41593057b3.35.1795416164019; Sun, 22 Nov 2026
 22:42:44 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103043734.2179858-1-wenst@chromium.org> <20261103043734.2179858-5-wenst@chromium.org>
 <avLw2AiqcnO9Blun@shikoro>
In-Reply-To: <avLw2AiqcnO9Blun@shikoro>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 23 Nov 2026 14:42:31 +0800
X-Gm-Features: Aa3M54qFQQaP0XRNtPCyFnaJIa2pdaKUHFg7uIqYmbd3iYo_i21tDqRJOm5IHRA
Message-ID: <CAGXv+5F5hf_8U6j6tJ1WcS6gUCiA82ny+6DXPv12g=vUjwYUhw@mail.gmail.com>
Subject: Re: [PATCH v7 4/8] i2c: of-prober: skip post-power-on delay if
 powered on sufficiently long
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jiri Kosina <jikos@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, chrome-platform@lists.linux.dev, 
	linux-input@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Wolfram Sang <wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andi,

On Tue, Nov 10, 2026 at 6:24=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> On Tue, Nov 03, 2026 at 12:37:28PM +0800, Chen-Yu Tsai wrote:
> > On some devices the I2C component is powered from an always-on power
> > rail, or the power rail has been left on by either POR defaults or
> > the bootloader. By the time the prober probes the device, the device
> > most certainly has finished initializing and can respond. There is no
> > need for the delay.
> >
> > In such designs, the system integrators tend to work around the delay
> > to avoid the boot time penalty by simply omitting it from the device
> > tree and the component prober. This is undesired, as the device tree
> > is not fully describing the hardware.
> >
> > Switch to the new regulator_enable_and_wait() function that makes sure
> > a certain amount of time has passed since the regulator supply was
> > actually enabled.
> >
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
>
> Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>
> @Andi: Chen-Yu is the maintainer of the of-prober, so I suggest these
> changes just go in together with this series.

For this series, you'll need to first merge in a tag from Mark's tree:

https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git
    tags/regulator-enable-wait

This tag provides the new regulator_enable_and_wait() function this patch
depends on.


Thanks
ChenYu
