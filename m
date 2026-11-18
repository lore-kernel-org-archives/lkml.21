Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795011388;
	b=AgpOH1AYRrbMbXBXoqXgm+SIM9b/6OVhlE5gcLKCRULdy6uV85XtF88rfK8Las96HHl/
	 4X62ir85ZWJeMuEjWDxU9+17PYfb046/eKm6mZEhfdEvbgczLi8jS6N5xvhsMiatdCgwD
	 8Y3KQQdUTAgRYp86SXKTssJNp38p9VMuAfiB538ztkvh50bdWlaZKnIYHHZM5SGIdkuL4
	 HFqgagt9cKuSnAamVu+nNSSViPEqQHbR29xA0E3Bqe8lvnLuGEBmVAErD1Y/RfamBtm1a
	 6X7PKFMwCgKl5iafON0L3TmLR/qMhgwEH32nJfNc89W/yRYejrDC7lGCIIRj7a0ZhDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795011388;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=PKEsbvmI/h2yNfkKYeLdhdyKF8D1G+AbgQ3dQC6oEvo=;
	b=S1qokL/+6GU8IuR238usAhaPOMzfSAnVneaV0kLGp1T2tz86dtTTgulMkeshkS024UM6
	 ZawKSKGsLXg1UFgF4PsMiQ/ofcKmunxcY5C3p05oGQrmksChBWiWA7BPujlrPO7/6IlE2
	 +c937mqRo7SAKXKFAvZ1CGJJtBCq+Qo/oX7PvrfH+7y+1Z9ZCrkY+AAnR/HlDWeovhj8e
	 oApjvGzCqBHK0f33fRvIgibDZuLFFcgKNgS31O3YItJ28x9mW7zAI10PttlsyKQ7TIWp2
	 gtSzemamxjWTOm3AV9DES1RFDdc9aKYK9S70WeIKc8lID5vj5yFsqTQWSZKuRjeDbkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=tomeuvizoso.net;
	spf=pass smtp.mailfrom=tomeuvizoso.net;
	dkim=pass header.d=tomeuvizoso-net.20260707.gappssmtp.com header.i=@tomeuvizoso-net.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=FWN5qAQw;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B53060A2603
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 14:16:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B53060A2603
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=tomeuvizoso-net.20260707.gappssmtp.com header.i=@tomeuvizoso-net.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=FWN5qAQw
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-491f34b4e0fso448576f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 06:16:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tomeuvizoso-net.20260707.gappssmtp.com; s=20260707; t=1795011385; x=1795616185; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PKEsbvmI/h2yNfkKYeLdhdyKF8D1G+AbgQ3dQC6oEvo=;
        b=FWN5qAQwKveUBEQJeHOr5C02WpeAM62kvCErITJxPeSJ2lIjjiN3De9AnHkqowlq6m
         B6SSZKqWo85wuMzcOziwpIZaY0RiomOHT/jYiTD62z+RpcIMCDM8OlBDqZ5vTLEr/t9X
         7DzR1PbY9poUpzTbfOGNcdoBczQwYfNobjN+pBAiYCy4Nk92VkQH4mRBkCd6r6QViMiA
         USm8740Tow0UUgjufaoNY3//ceqnTdIjAjsLerZ/lQgmvMHDQNE+Cs8ud0RGpC5fP/cR
         obNgBE1J/duB7aEizUC9Z4ZRJyDkbJWzwcXfbYAcdpHYSdrpciuJwV8WoLhlQFo/0eF/
         Svvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795011385; x=1795616185;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PKEsbvmI/h2yNfkKYeLdhdyKF8D1G+AbgQ3dQC6oEvo=;
        b=jE3LIIyWbp2b9/WRBFHyP3QhBaz0S7Im5FgNLCE9tMTNHPNbRoheZ9h5jFoiJIJu79
         TtIb9bXA/pUpsjwOa2oV5NT8maY6PPLa1P6QPPXzAWzdygMz8dWVwEn44olca9XzSZKz
         epWk7qvNKUTW76DizuLWp+43vnxup49dRs5APQrDzNASxcmjr+lrf9E+/oE9u6zqnTXF
         xOJWWrjbmPqWsNjOQmQmdalMb48hbtlzX9EduGOI2cIBm+NNN/GFAAXfWFOpNOvLc1wh
         mygyRs5llj/SKOYPj1TA9a76kVRuWQ9Putwk5NyQJSr5RgEDfnPC9ijam33g+GxYfoeG
         jzfg==
X-Forwarded-Encrypted: i=1; AL+hErHrpean9+PD3bvFn2LDkq954t7DcZWWsj9hheGNZ58+6hXMAo8YuQvST3qWtyyps1uB/80ZspSB2RCjTTc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9mWSyD34naHXlXmX2X1OxAojv6AXj8Jj8KmijXJRmyn9/4U7pD
	USHsNOJh8MMzOoACdotoCiGw4iEeXY9p35JYPKJKfx5Hy6kLib68f9Rar3qjf/58zio=
X-Gm-Gg: AYBFou1N+rYgW+vtOEhcBoqxxdw0qO+uJfLNQ9hzdA6qLOLObE1zbhA8k675l13wKou
	uG6SMVMhM2Ruioeg66drIaia4VpodSDrBec0/kxm7EasuUEo6tkeI+6cjMuZMaFMNpeRrWBytp+
	er0z0jfKm+SKGDogHtYMXOc/uT26xisejj6g70oXMboZp+uQlRtIyqYfDFvlGoe4skZ88lKW6Dg
	W7DHVN/P+bf02o7lMEI5dtIsORe7wHQslvy/DgHb22pshmUwJSgwY00f92j3nzYaPDDNeCmH7m8
	YmSklMWR2ishBirO8mnK3HwQj+6nDkkZMp16nYajQDYA0bzQ7qf+q5t64j0aLEMqlqDcRGpk30F
	WQDuiMfCCZdBxX7aWyJOg3Y/7c4beDEtJ9CJHS5VT8MAvfZYZr4rZ5uFz+vTTvnkPBniXjdNfmM
	FtTKAoejiQan4zqzfORCSmH57gsek9d2RtjSSOfaiYZhm0URPVsrKzSRbDJ+LmSUmoSw8CEez2I
	aiAshacywUtO05YmS3OI7FfwvwL2xwZE9q3hswHqRTk9/vwePYuZCVV2qRfIGTt/rGS1VZdifvG
	kMPCVpBOAjmoCclLBkkFvHyg44nx0gLZjU6ftnw3olBfWGLeM7eFAv5JkDnldTWxyM8mhEpNrJR
	XwH4fkv8XwPT33dOPCfq8/rWZ3LFpXDlfKrKwrOjL3Dn0dJh8eLPee3eLmaDLopCsjbV7SjY=
X-Received: by 2002:a05:600c:19d0:b0:4bb:5de1:e923 with SMTP id 5b1f17b1804b1-4bb7d6d1de3mr52112595e9.4.1795011385062;
        Wed, 18 Nov 2026 06:16:25 -0800 (PST)
Received: from alcachofa.home (cst-prg-52-235.cust.vodafone.cz. [46.135.52.235])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7843bd79sm146337145e9.14.2026.11.18.06.16.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 06:16:24 -0800 (PST)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
To: Oded Gabbay <ogabbay@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
	Chaoyi Chen <kernel@airkyi.com>
Cc: Tomeu Vizoso <tomeu@tomeuvizoso.net>,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>
Subject: Re: (subset) [PATCH 4/4] MAINTAINERS: accel/rocket: Add rockchip mail list for rocket
Date: Wed, 18 Nov 2026 15:15:23 +0100
Message-ID: <179501127061.337132.729815382590515286.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260814022453.437-5-kernel@airkyi.com>
References: <20260814022453.437-5-kernel@airkyi.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 14 Aug 2026 10:24:53 +0800, Chaoyi Chen wrote:
> The rocket is a DRM accel driver for the Rockchip NPU. Add the Rockchip
> mailing listso that changes can be tracked.

Applied, thanks!

[4/4] MAINTAINERS: accel/rocket: Add rockchip mail list for rocket
      commit: 20f0d3fdc8f51ff89d23f107bdb66db03e2dbdb5

Best regards,
-- 
Tomeu Vizoso <tomeu@tomeuvizoso.net>
