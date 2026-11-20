Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795186805;
	b=pFUTcHTEeQY+y/OG2YHWB3xcU3Gw7gi2D2RtqigRSEy8xTpkPrSqTaAXhhA8rSmoRf41
	 5gbbQakkE0yW8sGkPcYkyPgU9/K6FEoNaHkKzA9vP+3mRn6IHZKZFS4k3xhYdI8lGhQWX
	 kpsvMkQz9Pke1GNjUS33YsniH4gEZrw/FAahBnejoR/SpyCR3cyfLE8CNJvWvm2NqNwiv
	 Gcf3IlRA9gYmQ1XhawvX8GizGU5d803l1w8Ur+vQDIAv+kbmtoGsx9y6AApptV3S1XvcK
	 80GuORg2eCoY5OFS/9LKZXmTS8kDAaK2swiXgHHgY9o0iRYPytt6AHQDaa/KwzulKIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795186805;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=AX8ypABi3H5bwl0dPAjM68S8RqBMluRIWiERrnWXWW0=;
	b=ptPjfsrx8hoUamzhT4VD54vraZ/q1hxh88bN403WBRttA2TFkfgZaKkNwyJ5qpENuMx+
	 rXiyzB09MS1Cf5DqlFdTtFh1FVouCi2dVBOHalDpSYOxrCtWBFB5F1KVggQDogSOv2gyg
	 txWJSt32TkyQxh5xwIs8eq8RqlplWnXmrNCVk33mWbcBmeGqF7T/aQSZJ1LmNnsGeUZEo
	 pJxsg8/a5/4ezxUtUNBwQymyUGxTJdg/c4OdP+8iJ/O4Rd+mhHC8MqeLVi5LRgZCOtwCu
	 Obs8taz/U/e8Mm3YvR/GfBkqRbPDj/mHuidD2AK+Sq4J72HkmS65nl4aZKdtSdrrveQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Z+aNO+Xn;
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EED4860A5BC7
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 15:00:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EED4860A5BC7
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Z+aNO+Xn
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3b3fb193c03so511558a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 07:00:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1795186804; x=1795791604; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AX8ypABi3H5bwl0dPAjM68S8RqBMluRIWiERrnWXWW0=;
        b=Z+aNO+Xn6eVxfTqKm4KQxKsFnu+BlOkbCzcUW2PBVP5tBFbXv7yBl+JfuOQi2F1TdN
         58SlhxARbU6JNIYFvyTU8qQFa+nEXdtJFgBzjbn7qEJEJUppzq/O0fr9NDeXNFx/BkSE
         4/BNyTmhRvO8Pl6o/xMjLh5jpRQWfzqrzsTDSIP+8rgCk1T3h3sWBOXS3beu4pHDgOQt
         SBHoUQ9+JoIGE/2xXwt02o7XpSSDk6S/tAGLOS9piRj0pVSwSS/tJao3mB6yYt067/9n
         5wAoVrdQOfhYx32AGdbK9vxHZdj5jx8K1m7igdfj7AJo1Krh50hS5+jeacrtPqcYHTGh
         0nSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795186804; x=1795791604;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AX8ypABi3H5bwl0dPAjM68S8RqBMluRIWiERrnWXWW0=;
        b=CIeWd2RKk6clQZQB4/MkAgOUdtvz6r8g+c5HUV3yDN8/xrRyI0plrsnFthsUsHOsb9
         6SibLRJBUmJfvopcDUZJwLhBi1hAg+SgiK3734NI8ivury2tVunssI/lfz5P7n/ZJmV9
         d9Doi+UnoKYNINFOq2VVnwx1cNQ9TZBxIPemREoAzbeLuDFbibKKGaAd0y7OmQQmIKET
         ER9hhJoQhx+bD03UHUQmCXeJX9sWLWQpbj+8s0OaRXQV+Zt/3+hZYlKIWo1WvtvMCq0J
         d3t5STBzx5FYbHx5f5NWyzxuw/wrQYQT2jnaI699o6RVD/xDAo0HO07S6j6d2zrXql2d
         uhRQ==
X-Forwarded-Encrypted: i=1; AL+hErFFVxspcZZxrv31oZCQNsjAGMaLk7cheWb3Bt3f/f2VTOW86HJ2qvCoVLEa7ebEz9mgjNML5JSdwKe0Gk8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9V+dYhp3QhKH8P8Z2Lz76Lks7iJPl1vnrPHK3gKKlG1sn4Hiny
	XMd355v+wr3R10MpKowQ6XJa8mxLFlctlwsKRIzFapy+z9VW9SLjGlzuCuHaLr59oPo=
X-Gm-Gg: AZFdTZdw85qZEF5vDge0jR4LaxYqo1jHM62xVYDKc4HFYeHowAE5BX150i/6BXTx6Jh
	Lpddz/u7+4HsrOrNaItHNpua+Ra8rk06IFtK8GMrKexGy/EkmgZlrLSpdpDrVTAC8OSehadapgH
	JNmQwM3EinE5BXZ7tuixPi0KnA9/YOBmgPp9kE5nK8wVY6zXJF2ndhpWTqCmFaRLEoKuHXNOaCV
	cBR5iLUUKUd9SSpe5Vp+/fxDcIifglfZAL71ftZa57vtOGMDua6849AZgUEwWSw5rhmi7GblDvv
	hQr45K8nvuF3ZR1/WiZWKuhPH1n7P9cZQQKGRxp4wyjiQlTWrm2HRL67sSkt5TwSvbI0nNeN20U
	txokClT1FLoRv6G/GTVrWi/SWtiJ2EQH5ST/BumRpWnv4xunjbIga8iFFZDB4aTw9/iiU+zgf0E
	PNHcUx0g4TQYXdbxMQj8GXjgqy5AItSPZqSPi2TaQJwcEsshIAEbyupbZN/HAIvtxxQFzpMMZsq
	vRoWP7H4mEvAwjsHUdrdvZW1toKRPrJcz2IjZXw7PP45BdBJdty1ESpNkYnciozaU1lUV8BBC03
	dKkwWlEQjYuXZRbYA/jd1/z54OksUcICuAepsKD9rVw1DODuMRfYTCpss2ZD8R5m0Uda9YbBThH
	S5i+BixQrsaX6B4tszzC2vYkvIyBx/DbykSvC
X-Received: by 2002:a17:90b:2f8f:b0:3b0:d070:3c46 with SMTP id 98e67ed59e1d1-3b41c98a389mr2794326a91.12.1795186804158;
        Fri, 20 Nov 2026 07:00:04 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:8b25:951:ad8d:5cc1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41cfbdd80sm2197669a91.2.2026.11.20.07.00.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 07:00:03 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: mkp@kernel.org
Cc: James.Bottomley@HansenPartnership.com,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] scsi: mvumi: bound two firmware-supplied lengths
Date: Fri, 20 Nov 2026 23:59:59 +0900
Message-ID: <20261120145959.3128007-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013161620.3210533-1-yhlee@isslab.korea.ac.kr>
References: <20261013161620.3210533-1-yhlee@isslab.korea.ac.kr>
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

On Wed, Oct 14, 2026 at 01:16:18AM +0900, Yehyeong Lee wrote:
> Two places in mvumi trust length/count fields the Marvell UMI firmware
> supplies and never check them against the buffers they index.  An event
> with the maximum param_count/sense_data_length makes mvumi_show_event()
> read past the 512-byte event buffer and into the log; a handshake page
> with frame_length >= 256 makes the checksum loop, which uses an unsigned
> char counter, spin forever during probe (shorter over-long values read

This is superseded by v9:
  https://lore.kernel.org/all/20261015045213.3975845-10-yhlee@isslab.korea.ac.kr/

Best regards,
Yehyeong Lee
