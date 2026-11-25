Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795617693;
	b=29UZYLBqfWI4LBeOl+easw1iLxcqvG5vFtAoVD2slWwgp1td2RvGkY/VXmqz4IwIt7ST
	 4mFkHtgFiPvvHi8kZk2ZnqCiYINrRDWWV7QeTQ0cNl1mU3Bzu5pMLMG1456ub2q3dOYxz
	 l7LzSjn33ZoDZAs2zPUejKrDA1LgFWbFgbhDXVJ68rFkH6eHL6jCwCnk5GCBmXhWNFxZG
	 QFmYIHo2OzEC3UdUs6jcT/ZoiZzmk5975v2ZMPgHQPPNwHM+23R4BA603yV3fTHWG4omE
	 aV3ed/Ogg6/Qu/BRdRICg6XgK7O9zrDiNvjii00hzHqB1b4mF7Fb7OQuOfWoH+fRsAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795617693;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=RiFQrHYbOebwg4aSZm1pD7p5ODz57pewOJXxwjk/IsY=;
	b=fpxKB5YXkFUXKhpnTqYi/UdrcnDtcFR/IIW/4wP0brdYzjwRlXxA3sZ9Ng6wcdg8ywzp
	 Ng2Bat+4gDPlRIgrNYeG72XtkfpR9WvzcX+Ye4K5mkufDOyCcvTbd4G9BBm8YRByWRSc2
	 P3UKKOKuu/+1LWDnHdFcDa9SxLiiUGmJOPhXLA9LSf6y5tcWHzSUtJf/1019BPLKI7WP/
	 qHZFpWdFu74XQZD3fXvFYZmG8i7op1tBBQothxldXfCGVTFbyZY/+mdZsaCb/WxGoTGEo
	 IhAJzOSXgT1BU5QlOrz2TR2Mi8FPNymbbFmlDqUc8m62IEAh/fjvzps85sAKi9n/39g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lRNsOJqb;
	arc=none smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E0E3606A334
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 14:41:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E0E3606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lRNsOJqb
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c4d5b2db4bbso1121932366b.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 06:41:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795617691; x=1796222491; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RiFQrHYbOebwg4aSZm1pD7p5ODz57pewOJXxwjk/IsY=;
        b=lRNsOJqbLooDIrdaILNRYzBksZoVQm+MOGWWmHhZTKPuzlOd4BrJtS/qiEiyblwJPB
         3UqD+vZlNF9kJPrul8t7hiVfBg6OTgjBjTKw4AgyoDLH+B9bXC4UxWP+vyXTRnc5c1s6
         OYY3SpDnVP/9dLXd69kKn2ORDPIllG3IRc+sGuul+uh6Qa0/WGSm+xC1ndI3ZhhSv5NL
         vHClbFZLRToGsOtloVhH/iRiZ4QVP95kW5/flAVApjY59rAqq87veOKyL7OxLfI7C83i
         DEVja0SLspaqRCObDoUYxbQPfXtweKFb4tKh0r4fvFVuM1Z4wowpt9/XcaBKg0FvbgcM
         7k5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795617691; x=1796222491;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RiFQrHYbOebwg4aSZm1pD7p5ODz57pewOJXxwjk/IsY=;
        b=Q1R6VeJvtfjrhQyGhma6bIFTLK2NZxIQfHvqPVg4TIyb5GPG1KV0lrtShcNaAEpbJR
         x7BnLUjefrQrfyIzdD9bMFcRVdwLpcQfX4DQpL3xDmDg/mWwuMcMnTf+GrUhgaokmnUq
         CS7xBeovxYFt2BbP3WoCKRPMQeOychNghauFmywLNZQn8ilFYfGRUEM9iFnsxGNkRaVW
         +QFrh9K6SnBtR+RHKLVu5M+gGKFmJsOPtyBkgY+aqaGz4AnUp73nL3k46HOTEDaf3+Qn
         fyM0BB22kSL1K3Y+T07/2B95gcqh1xorNe3gZgl4EuBseSROX2qGhXIEJKrTKuBSfmUE
         kFbg==
X-Forwarded-Encrypted: i=1; AL+hErG31ZUFGsva1yfB122USljNJhPSvBclOoluJXR7Ev3ofR2vZCRn8OjctnAM2jvvj54KBBajXvRi4kHaz/8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8D3J9ZJJkmu4oQ0ZGzwazII6Jc5g5n73Lx0KsGwyVyN6uX9w1N
	p7NhKrvLwbZOZhd1mwSxI4XCnvn9gUXQACC+VLw6LTIz8A4dfwM2XTm5CONQmO2IXtU=
X-Gm-Gg: AZFdTZdHlUfNHL4cSz8Z5uJwfcUErWL1+HrFjzgswEv1GciTescOULrA6TEH1UxJCDX
	hAwpOOWPLRbGZ+2512PRbSFYoxV6xRgfI1X4fH8ThRQY1aG5t/M8KGczEa1NKAsxJznhe8rdnmF
	0KKuXA1Nihb3DlD9UacYhNS7U1WCtln/x6oSCa6VOs8wE97UjXQs6i0UKvc2inbERrtBj6S7+07
	evamaJPfWcGkwxM55id+tqbQaYSuBj7NlWw1RZiZ/RKDXGx1Ub2B13ra4k4BF+vPqdXQhAXuCq+
	WdQrxKa4n9qhKdBVYRTgVRrlWLfpC0VsjW9VoGbSMKPMTvE3/oYp5URplwdDhBJtvXSWkMvgN0o
	xEZcPJ6D21eQRiRRmHwEfP6j3OD0H6xjDpaAjhdyvCzTSh15GJR4OPYmCh7E6wFMnzD96UIqE0+
	gFUzpfpBGF3iT63LkqgIbddcx28rC7IVXyUIZLzh2RBWNzHEJ0ux9fO+t41eI8tMjTya2keb/09
	g9fhbLpfhAkR7YEBkekfo4PM28i7F8MlTvrVIQZET4wVyBvyQiDNH8vOTnqRKgwVgCEDXx+lbYt
	BReQbEdb2PLjd6ZYasrJso1kFU3ZT2sXfd04Y0EnF0EhggU=
X-Received: by 2002:a17:907:1c93:b0:c51:9d9c:c720 with SMTP id a640c23a62f3a-c519d9cc960mr349270766b.13.1795617691492;
        Wed, 25 Nov 2026 06:41:31 -0800 (PST)
Received: from localhost.localdomain ([195.155.168.135])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afe85fdsm653474766b.69.2026.11.25.06.41.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 06:41:31 -0800 (PST)
From: =?UTF-8?q?Adil=20H=C3=BCsrev=20Tepe?= <tadilhusrev@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sebastian Reichel <sre@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kaustabh Chakraborty <kauschluss@disroot.org>,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] power: supply: s2mu106-fuelgauge: add standalone driver
Date: Wed, 25 Nov 2026 17:41:29 +0300
Message-ID: <20261125144128.3951630-2-tadilhusrev@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261123-tasteful-famous-dragon-00ee8d@quoll>
References: <20261117104328.1176951-1-tadilhusrev@gmail.com> <20261117104328.1176951-3-tadilhusrev@gmail.com> <20261123-tasteful-famous-dragon-00ee8d@quoll>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Mon, Nov 23, 2026 at 01:30:48PM +0100, Krzysztof Kozlowski wrote:
> Even less relevant, drop. AI usage goes to changelog.

Will do.

> Drop, drivers should be silent on success.

Ack.

> Why do you need a new driver instead of integrating it into existing
> s2mu005?

I don't. Kaustabh said the same on the earlier series, so the next
version goes back to s2mu005-battery.c, with S2MU106 as its own match
entry that skips the average-monitoring registers it doesn't have. This
standalone series can be dropped.

Adil
