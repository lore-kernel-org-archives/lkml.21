Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795267074;
	b=E0h6U1q8vDWwO0nv6xKoMv2XaNqLilQMMj91dbY/J3BTG37SHfSeIHPcdohw7SR0YN8p
	 hRzl8BO607OSIP6VtbrLNYRnB5flZCtV27M4G6YDFYlQzZ4apisTVq6YmBl52U5j1rcLH
	 90G5Yk1rE8mETdegQO2O7+F7rnS+LG0y+HeA98EUnCY0+zRFUq7KHH+YSYt+72zhLHaJz
	 gYANs0qGC405Z4CdoDYacaYWvuLwjzPr5AACtjIBG0gpJE1xIzMhhHvvTZ8oQaPcXSUxA
	 R7IPx3zj8EEqiSJTTcCykm2aoMirImiJAUCoS9rQxnxWcB6eGH1caW6cH4yoneIYndQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795267074;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Rgt/byHJz73fVZB9npadRPJRCi06Zbw9U3jYPp0MPbc=;
	b=AFMAWBkaXG6xgV3O6/vmQvdiCFV/JiokBpmodiXuolOOvx8KEvT8IfqwvkrBtbhgGc7g
	 y3HaYqtoTygrP/Uk72IvGczDM7pvjUh2h3IkfMBiMhOmqhjEFSuz503FkLPTw/C/GyHGz
	 cuqdIsqqr9ZkJWsr8CCwK5flWA5vZC9WPgFc7NMw82X1uYa+IvMha9GyTj0PSTFnREIHb
	 28AWPH+LKeqDE+ML+t6Tmxpm5h+guB4+i/T65w7O1Y3/pFj55AOVG0yx15quLPPr5zW3j
	 c/Ya86PlBFKyck3uxghQTwh2BKlMmpSNjzNUhEWSUK7mdSfanHkQwoYaroztcBohI4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Z5292Tds;
	arc=none smtp.remote-ip=209.85.160.181
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB4E8606A330
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 13:17:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB4E8606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Z5292Tds
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-53644ab1f7bso16873621cf.3
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 05:17:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795267068; x=1795871868; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Rgt/byHJz73fVZB9npadRPJRCi06Zbw9U3jYPp0MPbc=;
        b=Z5292TdssQirJ7anrgy/Ycj0wO1diReVT+xjqWqnvVpWW2hxPlSx6CnnlxSpqetc1z
         +fddjESnGkA74Im6cQr17DvOW+VGIqruhO1KE5CwbJvPS54ALuMYtx4ha2VuyybUPXaT
         reAh9DT5rV9fy+W//lI4WB/2FhxslsHRt8LxjfYv7VRLIEVwboWlnhQtGGPVYMmD6ihL
         rqPFQZBMUV+gKP3QNnxGnSycOaF5ZFKfpghOCMHkZuVfrGH7y+3NT0bJUqPxS/JDH9QM
         4l+csvlxSOav/F6ZIn19ywP7A8Me7D4xiu4/Fmr/Wb6uhFimbUOp/Inli4T67eYP/2Tt
         /qYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795267068; x=1795871868;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rgt/byHJz73fVZB9npadRPJRCi06Zbw9U3jYPp0MPbc=;
        b=x/EsdhtXnU0Rul4TOgU97VXZhQrcmaacaZs4RUe+Vh/4PQaYPPXOaC/KmyBWTKCLjq
         eKcvZFoz/hXvAXPDY5R8YMjT+jsm7k6O+q8BVPwqxzbTIVzz348zHATch5zRDS7sf57s
         CBkJ/U5f/NjdR13wWl9JXHRh45vj2HpjKX/T8lxZu5cQog0t22EwBXKrCVBnr/cUoWjE
         uoC7PNPwnZRMikizg0r3tCMKHF/CVguBHE69+tESoNcvIxSiZDOOogu3hhACHdNy9ljL
         XDEcDz/Pp2iDBGThrE0/JY9q+9ZnihS1ll5uesxuPpT2ZJxv2CH3RhRwvGmu8Lskcm7I
         N8OQ==
X-Forwarded-Encrypted: i=1; AL+hErEuSvM9o6tnTQpCG0pR0m9k8+ObG22/4WGiTEQDIWeOGaWLdb+grCjK1L27OaqkXk334W1R0v1OluZvO8Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z/x2/bX65j7kNGaD24R16Polpvvjoj2+6j1KVx93pLswcO2nlnS
	ZghMzsehc/zCTcrf4v7VrQmfCuSDTkFkMA9o7StW+ZXnO4bbSGRdINQfT6nYNESt+bw=
X-Gm-Gg: AZFdTZcAq6wJh+uT+2xQbKulhLrpI7bbeaeRAc0OHxEUgQ98vyTbfOzbiKqo95o8ESl
	yhdY6SdUzN1K1YGIx3fFTEC9PsW+KdcvmZobVAyob3XC9AFnWennJNhlg08VFFuble+YqhIohd9
	Qoiap9EcxbUerG00NiTfCxzEgLDj/nLkqBKzFFgL4voQ93MllEwFcB7NYtms3sw39x7WuSmQ4/s
	uCAaKTUBqKFbtEiFnl4BqSp6T1c/Vg3sRpTuhCYIW0om3YILdtSHo5QoyvGHeBBjwoqyApiEuIM
	CQQVDzZx8kOCxAqwVO4Wp2RMKrc30Y6q0HcsIeb1J9th7lKn4aW2l/bbKgQ1jfV8UxUdSIgNZZp
	WrZ2O8BmNF4Rn4k+CvmVQotA17yFl0Lt6/B/iHI3VAz/TdjKsWjS5wXZvuD29dzn4RcWnLjCjKS
	RdigJ5eI8DtVKqrWlQ3vsFYswWJJhN6kFX0zxvic0ZyKGBmdtCiu31BgREzd0vAguxp9hhLCllr
	Da9+TwyUosCu7G3FbZ1mt1L+hgEBwtfhccHVc9VoE75mREWyCU0T6vaScdQYoszhlk667whR/QA
	3qZLiIMKFr5Bcc/Gq1NDrWiVHXSJ+4ngyUd0sdaxJlZ5d7qrwSjbIWG1/68jlOZ2yOBVIQ6WTHS
	1e9KVFrfsylKguyYFzzcCb1XU6Hd/QffIKIEAywLT7ctGs5Am9FT8iVSS9u2yeJNQjhRtoQ==
X-Received: by 2002:ac8:5f85:0:b0:55d:2dd1:48ba with SMTP id d75a77b69052e-55d76aa2f7cmr111131171cf.60.1795267067663;
        Sat, 21 Nov 2026 05:17:47 -0800 (PST)
Received: from localhost ([204.244.107.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921349b1e58sm53873266d6.12.2026.11.21.05.17.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 05:17:47 -0800 (PST)
Date: Sat, 21 Nov 2026 08:17:46 -0500
From: Ralph Siemsen <ralph.siemsen@linaro.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: khendry@reliablecontrols.com,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <clement.leger@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Subject: Re: [PATCH 2/6] clk: renesas: r9a06g032: Add reset controller
Message-ID: <awGZ-nCCbCNEuyr7@maple.netwinder.org>
References: <20261119-rzn1-miic-resets-v1-0-feee2bb28bb4@reliablecontrols.com>
 <20261119-rzn1-miic-resets-v1-2-feee2bb28bb4@reliablecontrols.com>
 <awATU_lyjPBxThwq@shikoro>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <awATU_lyjPBxThwq@shikoro>

On Fri, Nov 20, 2026 at 10:30:59AM +0100, Wolfram Sang wrote:
>> +static int r9a06g032_reset(struct reset_controller_dev *rcdev,
>> +			  unsigned long id)
>> +{
>> +	r9a06g032_reset_set(rcdev, "reset", true, id);
>> +	udelay(5);
>
>For future reference, please add a comment pointing to chapter in the
>docs where it is saying 5us is needed.

The reset duration could vary for each reset ID, since they refer to 
different hardware. There's probably no "optimum" value here.

Ralph
