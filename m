Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795174152;
	b=lWU8jNtcWsJcJVcEDRXe5e51EkJl5G3jdynIQYs/GQBH382HYytRli2EoSZj8z2+UuTR
	 m9qGxqYIcBODdjveDo2r34vSRV3gRLK4zvZMKvYLnXwbo4E3GwurTP5r94MVTKoeHdEhn
	 A70vmcgeQN7fmLJ+uBoSKmNPbx/kerNf3QHMErTN5RVJWsIBnymxxf//nzr1vXf8OjkPo
	 k6TXlOSs9fvLDctsTXAYZOuBoBIxH5uz0cbbG9X7Qo/ZG62XdW0bhaeLoscBh2QitLXgh
	 c3mosNhoD+2oxOPfHmzv5mVzxQI+ikZF+u69SVEb3MM/O5J0GctJjxx/tnjjF8vrhYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795174152;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=H2Y/M+dNCf7NZhZYEFajE482Mp/N89Yl/EG9+klpX5E=;
	b=G5p2+M0IL6mH8nBhfkeQDvtH7et1dSzj7bbl1QTYRYFy8cBpMjoOwvOL1RtYDzo0FIu7
	 dtIEODh6vpog+F451V6wBNFhhAmQVvsgfD+xvjRlU+gaLuB78UXU7MOMWso/ye9pG+l3P
	 LeUVyvGOpO1RAEr82+ybS/iUlV8yRpGtF+R4U35oskmdapc9yj35257BgQuwTSHqwShl1
	 UxwGLhe8bfhlHZws+vAEi603M5BXl7A4Lb8d9BRrc+0WO+LHuFiA4kLTtxmG8RxHRj1iy
	 0wLfw2giIYAJ6KH6kc9xPFYaVNM5XMf69bHtIKkLMjLMlLL9pqqOpgJdSQJ5mz7GBTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="AfZM2/3R";
	arc=none smtp.remote-ip=209.85.167.44
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B454606A336
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:29:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B454606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AfZM2/3R
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5c0a520df2eso736262e87.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 03:29:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795174151; x=1795778951; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=H2Y/M+dNCf7NZhZYEFajE482Mp/N89Yl/EG9+klpX5E=;
        b=AfZM2/3RNZ29zxQPByoziHGRKOMClQenmiFL0HtRQqnRJm8YjZt5KhowLUD4NAVpxi
         VYtq6CDWVgLbZa8gLAVBue0s5772hxY9T1MHhb9HJNKvF/5E67IhK7XYJywbs8MfJTL9
         YC0aSjb73iUI/o2k9GGx5/TOc0yBrCF4OsIItWBdQxqPua+FahxNhIeK47QgBg3EEUpG
         Wc9Ex3WHodxqhlkxJjcNDR6Vh0saHmUeh8ZnmFjd1ThIUjHakqYU9eCvp6NVY+L0FW67
         O/zsy36PWX1QGc1iUfrH+P9WR5uvQYuavSw6dHeMwrECVfcF5xzls6nsX15RUYfFRnuU
         1+ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795174151; x=1795778951;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=H2Y/M+dNCf7NZhZYEFajE482Mp/N89Yl/EG9+klpX5E=;
        b=IznOrtNg84TOFH8sBvUpbsu9vlksnQ0gtmN/p8GOQZtRusZKnnVpS0bX5DVLacWmtp
         zRKGzFR2iRxDEd4U0biaf9lV5IxIc2ZDwIRZSbKuNehiD+6jn414dWaFtKu+SWkDg6MH
         R2Gdq2jkwvQxUqI6qMY6NmYzznLwTxfb8vqQLzXUb7afeO9rWp1jknznj0To34OVTQVV
         wKnpflPWrx9eWxaISj2WnZ4e9GMF5zOJcMSXvwNIeXzC/AHzUH42g5wNZeDeVW3Db8WB
         P4tOJeBmbKv5DOiD+z2fMjLoUPWqURU9sYQrTVJYlVgv4Z39OW/skFMQQ/fVhsHIy0Uk
         7cVA==
X-Forwarded-Encrypted: i=1; AL+hErFKBFnYSEsqQy7heulkfrahnWcP+sei6eOFyCJfT1wYEBiy4YRKgMIbXl7sihR9VtzE+q3gNmE2OrIu8wU=@vger.kernel.org
X-Gm-Message-State: APuU4Z96f4shnU9Rqq0SvV7tZIhtui5v1zpS6TMzGNgPkFmJ1uP3rg0v
	jzLC93/ESHk/2GkQCp9TqduBRUtn9KxY0D/uXTnQd0ueJxlU3jC39QBs
X-Gm-Gg: AZFdTZe5rcxfO8BNpn0JSRu8fRLqSuWI0i8E0vH4ygD2S8IdWR+8j5bhUzauDufVa6X
	AIjiRI9adgg/H7Hb2cXl3+Vfa6IVUiustvEOFKdUO4/UF2Wqo3jRMgWhTzhJd/4K3kY8Tp3sW1i
	n/cKbExZ5Al9uB3DY/MFiQbvEZZEDr2pyoXO9n1YoGFu1oRcgRrEL3LbqkF4f3TM3mBX2JOz/6l
	fj8k6hWKyFP99rKqFjCPIXMiSP0oAKkglIAOV2oOJyV3hbpB91SiIJG5Lp54+OJrF8zslNYsQPu
	6+gk+t2gfjcGzLmAs9sZXvLGMbm4rZSCDHRcCOLNQPnJL8yPOZiZpo9nhWvXgKz/wmaPNNlQ8Xu
	FBA+FesysXudBsdzvphurBEn6OnjchHkP8HLQ1cWKiltqPhcD5iw+RQGqLQHoZENysc8OcwVyy+
	tC8eYx95Xbz1LmSaicpzZ6zSvElx9+nyFgtCmGuX1bPswIcHLnNvB5CZ+4N6qsiuKBz5UnjqbIO
	tbYsjJ0Mun3Rl09TDTAPh3TcNd4z0G2vnMNQRXnsLR5XO/+pA91+XkNGX8RYrNSRnzCyj9Gyu/H
	UdWev5W5Rhr3Cb0PLPurmS7R4OgBntry2JjEj4bJJSzKlF10stm/WdjZmuNWvDQIg5jySNLJTQ=
	=
X-Received: by 2002:a05:6512:ba6:b0:5c1:ac5a:52e6 with SMTP id 2adb3069b0e04-5c1bc865878mr898897e87.24.1795174150406;
        Fri, 20 Nov 2026 03:29:10 -0800 (PST)
Received: from gmail.com (78-71-189-157-no2450.tbcn.telia.com. [78.71.189.157])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bd0177f7sm491711e87.33.2026.11.20.03.29.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:29:08 -0800 (PST)
Date: Fri, 20 Nov 2026 12:29:07 +0100
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Michael Hennerich <michael.hennerich@analog.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Peter Rosin <peda@lysator.liu.se>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v13 0/8] I2C Mux per channel bus speed
Message-ID: <awAvA1rSGwh0RaIW@gmail.com>
References: <20261015-i2c-mux-v13-0-778a12cfe93b@gmail.com>
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
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20261015-i2c-mux-v13-0-778a12cfe93b@gmail.com>

On Thu, Oct 15, 2026 at 01:01:47PM +0200, Marcus Folkesson wrote:
> This was a RFC on how to implement a feature to have different bus
> speeds on different channels with an I2C multiplexer/switch.
> As no major complaints on the design came up during the review, I
> decided to submit the series without the RFC tag.
>=20
> The benefit with this feature is that you may group devices after
> the fastest bus speed they can handle.
> A real-world example is that you could have e.g. a display running @400kHz
> and a smart battery running @100kHz using the same I2C controller.
>=20
> There are many corner cases where this may cause a problem for some
> hardware topologies. I've tried to describe those I could think of
> in the documentation, see Patch #5.
>=20
> E.g. one risk is that if the mux driver does not disconnect channels
> when Idle, this may cause a higher frequency to "leak" through to
> devices that are supposed to run at lower bus speed.
> This is not only a "problem" for changing bus speed but could also be
> an issue for potential address conflicts.
>=20
> This patchset has been used and tested heavily the last months
> on a custom board based on a da850 (DaVinci) platform.
>=20
> The implementation is split up into several patches:
>=20
> Patch #1 Introduce a callback for the i2c controller to set bus speed
> Patch #2 Introduce functionality to adjust bus speed depending on mux
>          channel.
> Patch #3 Cleanup i2c-davinci driver a bit to prepare it for set_clk_freq
> Parch #4 Implement set_clk_freq for the i2c-davinci driver
> Parch #5 Update documentation with this feature
>=20
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> ---

Gently ping on this series.

Thanks,
Marcus Folkesson
