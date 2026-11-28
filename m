Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795874047;
	b=wGzKPsFUXd/7VAfjj0bSR4z/5yGv2wy8qBhp6G8f5OF20+UK3OYQu+2jImuYRfSovUwl
	 XKBUNf1uwcxC/MMdG0QGzet266k6o07zXxajRuwW1uGmTANZ9kxzoSFsWN0yTcsobmXrM
	 eVMYpjuiMdD95jkNXUaLtCQ2I0eImdaEfgOhZ2TSECU2jZX1qDVFgxGOGhLh8vdYYueUH
	 lUJJT2P3LLf99aLlIlNSxSIlaisXiqOkIwIoTI/xI9V+evFseQdH6mE7JjHsimIgzg8k7
	 ZnGCJryuB2+0SEr8ZhoEnqFE4mXLMKhqSFVsfIHH6tikq0ZR/pIjrr0IAplkxmc5z3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795874047;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=9mX1XwkpZzZFlEfmqdehYAaIQV9Aq1Y+dGqXT/HOfNg=;
	b=YoBlNHF7BxHKSprh52foxbcgDcFwM0BEoIjP0x9PhZv4/CCvhrfqJcpN9i4iAYw9ltkD
	 1wbKrQfC9cAWNCrf8h8/mXV76Qkn/cegQUBAZNBZJugf5pW2gRULk6YHQI9kgpVllz+fj
	 OyXtHROlPPjtaBTDd4q/WOw4NuMHiph+0rkqSdWKPpGnZS9TkIuEwdfDdlk/UBMSIJ0Wv
	 SsH0s0wfVeIGuFQaA0FjjGOVubwzO1ymJdecyihQ+dIDczi6TnVnDkwsyK7CcDivUHAMB
	 Bkwq/yvrpxeHJMyxRRQ3my7pDB3OFWBNX3O/k+HffKhx6IPSPFrDfu8Amz6kHUS7JKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qi2hXA7x;
	arc=none smtp.remote-ip=209.85.167.45
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B177606A321
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 13:54:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B177606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qi2hXA7x
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5c1c0c8d61aso6106787e87.1
        for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 05:54:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795874045; x=1796478845; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9mX1XwkpZzZFlEfmqdehYAaIQV9Aq1Y+dGqXT/HOfNg=;
        b=qi2hXA7x7wrRxNS2ksI35vF6o18iVAI3siMasQCM0/EIvffM/SgAi9ZV87TC+rfFl+
         H5C/YM1XB9Qut/evinyE8MGbSoyucEesjeEw1HI7Ta739KwyxudLpTEblh6MIA3s+WR5
         +M7pCyTPFnJvc1NOGc6orBtpamkbWmSz03k4L26GfbeDECZPji8MhwOt8zFRsURVKAls
         5cLsXHTN4w4d3Pp/ShBy/VwZIzTV+kfNVMNj17HuUUMXbgKdKYPb+Gh4sqTWys+zQDN3
         u8+76dz5XMoumQKDrnAt5S1X3nDr0XG9tn5EtHgTikDZ8poG9RP7jcRfkfIablVyqSj7
         1P5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795874045; x=1796478845;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9mX1XwkpZzZFlEfmqdehYAaIQV9Aq1Y+dGqXT/HOfNg=;
        b=PTlGbgHmtCqfeq+2vwf1Z24RVMelRfena8yntS0yz+vlp+FA/IpoPvW3u2KEkB354h
         w1BED1y2r8Zwms2Jg6pdIpj8RNx7AVOMU+H90Qz/B7ypyoFNsPE6lbs/nELPOJYyFc2a
         tNwtlm85QTcgTyZqH2tid+Np5qw78u7hQl+L16a6sj16l9s5Td2OwPntIhvS+4hqsgM7
         xLRu0LJcainzeK7yuoUVdwj+oUB2yD1zV01pvbPrViG90lh7a1Qt8uze3mZOTcUlMs9P
         U/wSgCgklQ35kDG3VUq6c+7eahrLmhg0iebNDjZB8Y6v3KDI9e6ZQl8X84IBZgITlpZM
         U3rQ==
X-Forwarded-Encrypted: i=1; AL+hErEBdqxNONNLdtQoRxtACdAkzyAqp8609xyeMuuGSc5fRB1Dgx0GUHooIYs2e5IbdUatt0q3tcFIKcBDTB8=@vger.kernel.org
X-Gm-Message-State: APuU4Z95F98xJx9kJcgTW1ff0C/MUdWzUnd2kVEcnuA/u3xJIGUe9Ksm
	amXuD4dd+tVh8lI+vpzYj9RJKEyK4hNQ5fD6paNUfSqcrA6XJJoCTazE
X-Gm-Gg: AZFdTZcHEJy7kB3yRePOS5Ekf+hsqyXsL/lHAo5FXatSqGe+D5UpFidce7piqoYdlZj
	Y50T2IanNqlVxitzjtfd5MW0vNbmIDhEvq7ZP4LWUHGNeSGrQnD2v25tPolOcLzasPrV5bvEDzz
	sectk330w9DQ7NLiGw57ozNLEF/v64A8jlssIVQewFl368VObbH0nXFI/UxZjk3rar3ER5XwSVV
	Tgim+wFspv9JxOF9zNeEzIrVJsBoRoIQQH4olB5An73cHxGDr7d7diTr02CLatWdC5Zcw3E/unc
	/TrH7ZkQNxZzQZEKkR2M9Hw4bvfN3W1i4OH4Jvzkf3Wi/V+wrQXgu27cLhQNjdBKqBS2ArqR88/
	tt2eyaxRKaXk6aMFtUHNED0cTxZ7l2D99mwqixJ6VSJ8XZ21RTRAl9e3TWU0bvD04jgSPXxOBn9
	2OS12bO1EXrfAD4nfbJYsATFd4nqJNqA+/SFkvfPn3g2pyP1w0SUQdUXWLJQ9EY6t9d+LQ3rS3Y
	50/YPu9mldZ0MrdVHqvgC+uU0n1x9iLPN9cwdI8eVsHaMVxrlpvxp1JUO4iWXfhaPC0Us0xCnNN
	rhXGaZDZOpvWAC28EAY4D3Vyqvh6opTvZNCkPvrWwcg4KJvwhA==
X-Received: by 2002:a05:6512:239f:b0:5c1:5e33:6994 with SMTP id 2adb3069b0e04-5c1bc7ad610mr8583121e87.12.1795874044617;
        Sat, 28 Nov 2026 05:54:04 -0800 (PST)
Received: from hekasnap.home.hekalab.eu ([2a00:fd01:82a4:d100:34c4:da37:4e1c:e424])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bcff8bbdsm6725546e87.28.2026.11.28.05.54.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 05:54:04 -0800 (PST)
Date: Sat, 28 Nov 2026 14:54:03 +0100
From: Troels Vognbjerg <hekatombe@gmail.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Andreas Noever <andreas.noever@gmail.com>, Mika Westerberg <westeri@kernel.org>, 
	Yehezkel Bernat <YehezkelShB@gmail.com>, Mario Limonciello <mario.limonciello@amd.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	usb4-upstream@oss.qualcomm.com
Subject: Re: [PATCH RFC DNM 13/15] thunderbolt: Introduce Qualcomm USB4
 router driver
Message-ID: <awn29nfzVzPi-HDM@hekasnap.home.hekalab.eu>
References: <20261124-topic-next-20261116-fsm-mvp-v1-0-a9b45c69cd38@oss.qualcomm.com>
 <20261124-topic-next-20261116-fsm-mvp-v1-13-a9b45c69cd38@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261124-topic-next-20261116-fsm-mvp-v1-13-a9b45c69cd38@oss.qualcomm.com>

On Tue, Nov 24, 2026 at 21:01:42 +0100, Konrad Dybcio wrote:
[..]
> +static int qcom_usb4_mux_set(struct typec_mux_dev *mux, struct typec_mux_state *state)
> +{
> +	struct qcom_usb4 *qcusb4 = typec_mux_get_drvdata(mux);
> +	struct qcusb4_link_req req = { .usb4 = true };
> +	struct typec_thunderbolt_data *tbt_data;
> +	struct enter_usb_data *usb4_data;
> +
> +	guard(mutex)(&qcusb4->typec_lock);
> +
> +	if (state->alt && state->alt->svid == USB_TYPEC_TBT_SID) {
> +		req.phy_submode = PHY_SUBMODE_TBT3;
> +
> +		tbt_data = state->data;
> +
> +		req.cable_max_gen = TBT_CABLE_SPEED(tbt_data->cable_mode);
> +
> +		if (FIELD_GET(TBT_CABLE_ACTIVE_PASSIVE, tbt_data->cable_mode)) {
> +			req.active_cable = true;
> +			req.cable_legacy_tbt3 = true;
> +		}
> +	} else if (state->mode == TYPEC_MODE_USB4) {

While testing this series on an ASUS Zenbook A16 (UX3607OA), I ran
into an issue with a USB type-c display using DP Alt Mode.

TYPEC_MODE_USB4 and TYPEC_DP_STATE_C share the same integer value,
causing a DP Alt Mode request to be interpreted as a USB4 request.

Changing the above condition to

	} else if (!state->alt && state->mode == TYPEC_MODE_USB4) {

fixes the issue. The display works again with both USB-C ports.


> +	} else {
> +		/* Do nothing for e.g. DP altmode */
> +		return 0;
> +	}

Regards,
Troels
