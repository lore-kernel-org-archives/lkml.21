Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795147367;
	b=TfK9RgUPg7GW2qZSIDWWhKFko20WmqCNnTR7O9WMkR0fPogcwYuIjGFthe3z67leOP5l
	 ZKomCy6KaaSe5lg0oaNdlalw2hJxUQKMS67dEYTokvuWQCU79iHMkVhnA/ojUfZNGC5mH
	 saHLvU3taY/R6+o4BeCMRyWI/3dWqtLMDkGSxZSDbiYkcNBkd9ERk0hJEiD5wMnWdeIjx
	 nnoFZYmkP5GUVUZAaYKmgTXyrcgevFqzcPJSnhHpfl3+d9ChaakxOJsr4PV5FDYjmks6k
	 +M/k++5K1xrK4Nn16+iQyYRjv2FUTuc+wEGG/KFyPdGkM1HK3KDfVb9AutSPoujKLUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795147367;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type;
	bh=TRNzUGKd2wKrR1v2ESH5QmUc5jp75PiKHVdd0VEreo0=;
	b=MDkho1vZUAb/qxv4cuL0cvCW0EdxcLUZ0HSnq+VA+mncrw8iSHM5I+xIDIR+twEukiS9
	 xusI7Q0BWtwT7jlg+2hlrCSYD2PwBebS6RFUW+HKE/kOBG3ma33LdA5TcWDA/QZ4Y+aoQ
	 7qOfyG31VaQ0ahCudYgpTlUvvzLsx4MAT+YB46Sb/mrZa88+e9yxJQh4Zh+POjzQgIVQu
	 jqm0xf69bhvoxtKfaA2NJ6B5A6CIbVAL6Lj1hitzjYbI6055LmVI/deLioo358/Tbtwpa
	 r54bqv4P2QVu3eTeOZBxqUw1SIFJmJT8uoYelWbmMEYEuH1nVISS4g6/MQUdRjcTqXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SX+AD4Db;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36C89606A325
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 04:02:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36C89606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SX+AD4Db
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-38587f3de36so486636eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 20:02:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795147366; x=1795752166; darn=vger.kernel.org;
        h=content-type:mime-version:references:message-id:in-reply-to:subject
         :cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TRNzUGKd2wKrR1v2ESH5QmUc5jp75PiKHVdd0VEreo0=;
        b=SX+AD4Db4u/1rH6+ie25tXW4GxQhcJ+O567ogQJWIeCaFFcC/wn2bFB3i6t3NXc0dJ
         hZu+h1ypxP5/NGOyu+4Ww0lhN8bPxmwAcjj22EZtnZl7dwma5YRp1wT6ZeYSJAMkOnsn
         UoWaZp9jUk9ndt/Fcnll7b19qg4bI7Oz/dNAewKOdLWw98vZfCyG2FSI1izfT9xb5vYY
         M4a7cNk6VAQFIAtRUzsyMIkHENyeZ070KmFrn4V53ml6sdtriaxtgmSfsrt1fQIctx18
         JdgFT6i6v3GTuz5jgLdX+wC+/vO9J6hP6slNwKx4UGjzsDmrPwkF6jup7f6xUsbCy7/Q
         2JkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795147366; x=1795752166;
        h=content-type:mime-version:references:message-id:in-reply-to:subject
         :cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TRNzUGKd2wKrR1v2ESH5QmUc5jp75PiKHVdd0VEreo0=;
        b=ppWNqGD7KHuVSTIpPRhqFlHwAwPOmJiK9pIICcQHWir181k6VZ4mluyNplYQ3LV4+/
         P1EXvVK3HTH1RGl/5f6JVTxeOp0cMwnNVko2cG68ASWU/dS9mEP1AsMOzdZ3qmI8n9qo
         YL4iksZWZo8rK7J1rXA93BvUUEPA9U3liR9uBsrOgzNTFeHqAH3EjDkelUKjJEaFqjAB
         IxUx3HVXbVxhomn/Yp9axNX3ASzKRZJDVj13rrGC1c/6SRiP2q4TZypqcjkun1TUqfF1
         mkuwWc0oMCSC4HtNRBotHkP9Y4bkwifSUaoBzKQeLfm01L0v5vpdw1rUqpPaWsQzM7uz
         vwgg==
X-Forwarded-Encrypted: i=1; AL+hErGigcyBR0evOx3d5BFewvp7qJrLg+vGqTdYoRyCHnKiSueSbK2pq9UJt8aZZoRG3/97eIDH8dQsFH5nhVg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9EBcIAM8pPGqkl6R74lXauuB9DEAJMwYC/9UZHepmbcoXLnlTZ
	XEnkqe5pmcEMsZVi/AN+fTWINgjwdTKsPKa+gFQLG9H9rw3TwQwjdgMP
X-Gm-Gg: AZFdTZeZp1CdnHumO9fmsST+ejgumvX4HLJaexpTgXkF/dxHiclgTcNFWyBpT3wl2RZ
	cRaS+U93fnlaoygbU0JasJGea0FPiD6s46cUBZ/gYnN0hreRiGdtTPTymZ9McXvwanLjsvzKS9d
	Bf7tXCyljRuLBj8lCQGdxflkjTMUL8y2zh0pIEFsgfIUgCb8eJ3aB1UbFvoVUXC0bZXIJP8s2L1
	8AYGOypEN/iigXNNTlabXYGd7W+BwSsRa9+8Un3FF4Jkdfb2ioN0drGVsTFgl+1IR3Q3FH1yvFz
	PWaFLpQsrhi68dkCJs7vERtJamnHGfq9m3ncQ0JgM7ijIE0els4bzCFTbjfYk58IK5pUxYfDowu
	2tPzZxpE+GDnlItUpXcFUV2PFboWuSaak/dIrOo0tbLBejsf3k3yl0v+SQSKgDrVKIzjsLduc0A
	VY990QxGA4hZBkuKXNNT1Tv0mFIyhz+/xlJtwO3CXaWuEMrswPiinKXn90NJso2s511eAQEnG4V
	nySVQ+gKaedYq5LtJqId6c9ePfCTvcJYZINDiKE2La4f4p2GW28Qj5rQYcqxvgfvJobUNg25bQ6
	tWSbW66TwIeYgQH6al977FI9yeFsOwJTyWGb+drpNRQHIVS4oDxcD54Gibx8qeDVDikf77ZwUag
	6wedspMZoAes=
X-Received: by 2002:a05:7301:259a:b0:36e:800a:71fe with SMTP id 5a478bee46e88-3856c4b844cmr1448219eec.1.1795147366198;
        Thu, 19 Nov 2026 20:02:46 -0800 (PST)
Received: from DESKTOP-7QP7L26 ([45.190.211.142])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm3663071eec.26.2026.11.19.20.02.43
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 19 Nov 2026 20:02:45 -0800 (PST)
Date: Fri, 20 Nov 2026 01:01:56 -0300 (Hora oficial do Brasil)
From: dev12124 <joaoanandalima@gmail.com>
To: jasmeet.bhatia.us@gmail.com
cc: ilias.apalodimas@linaro.org, ardb@kernel.org, rafael@kernel.org, 
    pavel@ucw.cz, linux-efi@vger.kernel.org, linux-pm@vger.kernel.org, 
    x86@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 0/2] efi/tpm: Preserve event log without changing x86
 E820
In-Reply-To: <32909f9cc196a161bf380b6f64603b75@gmail.com>
Message-ID: <be1f79a5-6685-7188-9e79-05ba7acb98a6@gmail.com>
References: <cover.1788259938.git.jasmeet.bhatia.us@gmail.com> <a9e23066-aa75-44be-ac3b-9a15f4cf6047@app.fastmail.com> <DL6NCV1KQ9F9.6K6XZQCS4AF3@gmail.com> <c3ca811b-a6eb-4f4d-bbb2-4feef02e3db2@app.fastmail.com> <CAC_iWjL9jDsRaU7kEemYfwk292Nxa49cK0Rq=81pC=FWNRDhvg@mail.gmail.com>
 <b66f68b5220ddcadddb41340d3ea3388@gmail.com> <CAC_iWjJ1L5MYWy2vHG3AHYcfqx7urJmaTYP7vuyvZm8GSnWCDw@mail.gmail.com> <32909f9cc196a161bf380b6f64603b75@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="317403-16462-1795147365=:13716"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--317403-16462-1795147365=:13716
Content-Type: text/plain; format=flowed; charset=ISO-8859-15
Content-Transfer-Encoding: 8BIT

Hi guys,

I reviewed the thread and I agree with solution: Discard the TPM Event Log 
in kexec and resolves the hibernation issue;

Is a good solution.

Thanks,
João Guilherme da Silva Freitas Lima <joaoanandalima@gmail.com>.
--317403-16462-1795147365=:13716--
