Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795381892;
	b=XvF4syfarw7A43BuPzfgTpZZ916sBmEwzVyR6shnLleBeH8oojYFKuce7GY5wGw3MVPi
	 u6HjRfyPPYa2DaoO8MdiqntSAZFzd0SAShbqndG3EqQ+nVTuzug6TkHgBwBrls0aGD6WD
	 wq/udW++Z7SBEj62S62pnC2SJV4E4ITCAkhAfHpCzj+vG2c7LjKFI9cJGhB+zkMKe7PM1
	 zZi2mUra62UMO6FMf/Qth2UyM77no/xnl2tOrUdrt3bYqxbq8h0vhdtLE6e4lOMcO/ucv
	 eeS6BQOpG3b/A2qKKaWf+VSQbL0A4fqdgP4AZaXI9ZlVfvtdoCE9OJLV69NeMATe81Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795381892;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ge4eiVUKj3nX4tuUYC5k9dPzCXTKzLAWVgrNn1CnYhg=;
	b=mTKn1LQ7tz+U8rkeyxIMBKxQBbstQJd/18c82u7Xv7BGIp+ZomFHZHRGlpTTIjPDw8g6
	 etql5CjqcKDHc/qVnmW9E8PYiYNIm1WThyrcG0lz9hnxzcjSMByWdgOoO0nB688OJMFkH
	 FAr/8HTSyojWH0pVIxpi/PufHo8qCgQQdKrW4SoUSX6gA0qpPUFYZ99AsPq/uX59bOJX7
	 uI5i9VQjKwBx2x6QxmsSFr94RYRbwCfOFzx8r9SofldfIDkgo5/WfiIvXm56svhlw5qz4
	 ARlAwbII7uvV9UknxTJPzehh7A/zLhE0owNcUhptn7mNQXRqKi6gq6jknuwAdN3JQZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=teslabs.com;
	spf=fail smtp.mailfrom=teslabs.com;
	dkim=pass header.d=teslabs-com.20260707.gappssmtp.com header.i=@teslabs-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=jFz4jAsb;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BC05606A327
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 21:11:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6BC05606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=teslabs.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=teslabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=teslabs-com.20260707.gappssmtp.com header.i=@teslabs-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=jFz4jAsb
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4bb6adaf0f1so22562825e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 13:11:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=teslabs-com.20260707.gappssmtp.com; s=20260707; t=1795381891; x=1795986691; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ge4eiVUKj3nX4tuUYC5k9dPzCXTKzLAWVgrNn1CnYhg=;
        b=jFz4jAsb0UInSseLDcDVLtsdUjFuIb2lcwvCt85BZQgR1AT6Fx7rZhyuuaVcztw7DI
         SHZ0U/ohb/0XMsoxbT3U+cWFyWwo5LwSY79yKpzQ9cGwZZ1rPtClIS8lccyn0YbSHO8Q
         /MbnqSeiwU3pJZcK2XqSv8Prdfql/n3LX6gHlHRTEsaqIK/O8NKYvVQTS65FbrWrUakf
         ohgh4YXvxQue+l+JfIzOS12pYHL4A5CVRM4zQZQhe1nsW3yo5Wd9BAdBZ/ebu6iITp1O
         cQ5rRqpwGZsqMLYRn8EO25QkPYSN8e64BTQt8kV9VFMArAkZslZyHa2vOjnruEv7VdVw
         yIkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795381891; x=1795986691;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ge4eiVUKj3nX4tuUYC5k9dPzCXTKzLAWVgrNn1CnYhg=;
        b=iWA6thk3S1jIVa4FFzD2nKjO3yfgSLgWLgXeurG/1bPatW9B/Q/+lws23Ky/WYt3up
         NP/RvKJBGCgAny8K6t6OYdInkCq/8qDWTYoGtNLiuw1KBpIZr618BxfZoXQwMQFkTX3f
         dkEVktuPwMHe/Of5Bh2fkd+KvPMnE5vrP8RWVLTcErJKJcwwNuKOxmp+iuf0QfXob+Os
         L1vOxqlrW2ngw1w1e7wClVVZ20tydVhHVmIZOOAOvPrik64y6/mN3gLysRb7WGQBkuc/
         tK3tC57Bax8iITW5PQLev3QS9s3qB4wVT0ypIcG2+dhd3SPP5RzmbLgmRoRE8aX2k8Zy
         /DAA==
X-Forwarded-Encrypted: i=1; AL+hErEidUGYcx/60085PXeSs9TUDea75Npoy4WbR1V0KSvRG+hawntG3GvR87I6Mhsgfz8b/M2UkAHwOt5iBio=@vger.kernel.org
X-Gm-Message-State: APuU4Z95iQbYEqm51kKEmRTwjKHL5w5lWxYBiWbE6L85R33ssdmeRdMQ
	Bzt8uuDac2Y7MmTPdm+SenOo4YwLH2TRwD6yWd8DCCCTDDgHS4qFpyVSiMgr1UXbpcY=
X-Gm-Gg: AZFdTZfs2bmBjctdjKJQBmPkmsp67+2ZYaRKhkWMiU99EyaQhw0tO758weelV9P7EpE
	X7jhYkvMt6yEuYxDUiYivBT5c6aoLH6JAMAoNvpX/+eOW4kv8Di1LKcHYihMtsPDyaiTkwYd4AP
	om9eFlPPlRliZvqlOdpRKuouJWhob69VOlLUeu7v3j2eX0/GAKsjm+OQ+RL+ewaPzDuVAeeMTry
	eTP5Vh86pxafwTprZvEVoydhnfKh6nKisOyXjxWlMQUGe3Js25l2ZlfWslEWX0YrmgJpZ24+dJW
	N95u14a2/Eh+jtaXbCmFUbueQB5kfzZCYO4FzxnW8TDhHzb78rIvv6rzUVrgNFGLRVWNjhas6EU
	EY+oU2+TUXY1n/Q4Asjil35P7M011AjYrGKsKJGMNlVHOt2ic0c0Oq7orXKH0XbDtFK89cbPmti
	VHZFqferVkgKVlt8VSlRpHwWwEsNEVavRpslRC4T0+Mwe7Bz/T4xpSp7xzjQ5nN4at6z0ApWUTf
	8A0nQrqDLYQCxbUCzoguSgEXNxhACNB4YARE79dSW22IDbDJoTmnG421lO8uQZ2W80d4uL4piwA
	kW3Z+fiW2j5+lqK8g/G8sDllctiPGVmZUwKQNQ0hsi5+Hc+CxED/qoZif0ub/TQK11xvPohGAUT
	eN8BeQ+v5ULM=
X-Received: by 2002:a05:600c:3b88:b0:4a2:191f:7cbd with SMTP id 5b1f17b1804b1-4bb888078a8mr229132545e9.11.1795381890664;
        Sun, 22 Nov 2026 13:11:30 -0800 (PST)
Received: from localhost.localdomain ([139.47.121.129])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906640a2sm123545075e9.0.2026.11.22.13.11.29
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 22 Nov 2026 13:11:30 -0800 (PST)
From: Gerard Marull-Paretas <gerard@teslabs.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Frank Li <Frank.li@nxp.com>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] iio: magnetometer: mmc5633: Enable the VDD supply
Date: Sun, 22 Nov 2026 22:11:28 +0100
Message-ID: <20261122211128.14591-1-gerard@teslabs.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20261122205211.6c46f3cc@jic23-hlaptop>
References: <20261122190836.66111-1-gerard@teslabs.com> <20261122190836.66111-3-gerard@teslabs.com> <20261122205211.6c46f3cc@jic23-hlaptop>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sun, 22 Nov 2026 20:52:11 +0000
Jonathan Cameron <jic23@kernel.org> wrote:

> >  #define MMC5633_WAIT_SET_RESET_US	(1 * USEC_PER_MSEC)
> > +#define MMC5633_POWER_ON_US		(5 * USEC_PER_MSEC)
>
> Obviously the line above isn't great on this, but is there a spec reference
> we can make for this timing?

Both datasheets list it in the "Operating Timing Diagram" table as tOp,
"Time to operate device after VDD valid", 5 ms minimum. I'll add a comment
referencing it in v3, and annotate the set/reset wait with tSR (1 ms
minimum, same table) while at it.

Thanks,
Gerard
