Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795595105;
	b=G0awFKIQbsoi3/hJ8PsvwpIsmjMwXJD3hSc4MQYHrIljftjUHM8kAuouTEid3dJmf1Bc
	 ElDnGTv2S0H2dwmoKC1WIDbw3WSlFbl9ISbMtIniz0It67LAOyp+sYNJI6JVuaI670SkJ
	 7NBQCm6/xWiRl0rFX/Z5AAI3f9S6oNyW3JZjSDa8gfiw1/WoRavFIbvA2jHx9RgyhtZgh
	 +I1m1ZPw1RfNRzw6eFkZFSjMvV//OnUhvtsQ6IsxF/jBl6V2kBYSGhnL0omt25el4fTcQ
	 l7L9f5vzp8eCt9nc+P9kIf7LyHqqCS7GcAFOkOaN3vHBXUGdDiABuIRbfRJ4LxoUPog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795595105;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=0cPSZ2Db/3oxf+nJ3B+LuZEfDbqz7MLUc9BPmfdbovI=;
	b=37rz0/i2Zbrork8V6VRtL0ZbVKaJV5cLoL1hhnLWa2JFClzOhBtVlQc8cp25Iqu93nf5
	 ceGzqiFZUMh6/6CcemzRz0Jp1mYzK4Yv8FagMp31o80mEzbxxrxuW0rRePMMVrkoUO2g+
	 +H0da8Mqj0eWb0gezXrI8LNQFJf8kP23Y+mGL37S/3rgNmIYTeZl7wsT2Hixd1Pwma0cj
	 EqQBSCP+e5t+n9DPW7lrc0w6clXQ4d/HW/7GMkIiRfnF51cF/ju64X22J/73fNeglnEau
	 YHZy2vUtFGavYR8r4Lr9b+kxRtGnGaIKQI/0eWl593fgRFtjAIQvbvS9jlWKGhMHSUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M3OdydL+;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6CAC606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 08:25:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6CAC606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M3OdydL+
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-38190551625so10949224eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 00:25:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795595104; x=1796199904; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0cPSZ2Db/3oxf+nJ3B+LuZEfDbqz7MLUc9BPmfdbovI=;
        b=M3OdydL+osjgiJaltAAoiTaI9znp/ISlBskaK6mVpHjWGwP7TpvmKfIyh6rBerRNar
         Jhj6iwZRU7lAjrozAa5m1myP+ss/CE2rjAm/F+1QURh5qGmYKAVqF+aZd9bAxrTyfq90
         a0nYqxQTHh5STZHe9l14d+/ZUOUd/v6DY4gvsyu4mNPenVSa/+EGLYWcix6oh1qUOyEC
         Azk4ctfp71lAmtYDpYvampfPewlA29Phn9KTVGLeysON+pY+ispHiO1MoBfpSSF2ae1p
         EQu1zE57LD4oIzSczM6aRWHvbwA1pMSeIS4g/ETGOfYprQp4x5dWjLQgfkMqapRIYahq
         FUnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795595104; x=1796199904;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0cPSZ2Db/3oxf+nJ3B+LuZEfDbqz7MLUc9BPmfdbovI=;
        b=04fmm8ft27Mnhis3JwMmZlprJKiX0lgEdT78IsIf61VFjtQfLx+R27RxBaWQHe95Dc
         EFG0qho5NKm0s5Pl/LcfnQJbkhCVv1p/t5O28FDizNF7T2u3Tyow4NF+zcJyqH2zT0iL
         ap5nOccJzsPuZ26mX/3cXHyIltJE8jmN5gwfCUAddZccvMdNVFus2UHDLKbm1OoZ4wBw
         EpxiuW3X/4JwL9wJArzyPXOv40utO51ixzqEXAjC9hliBOZC8Tzcbum/zF/EtjsQxIdG
         lO8ACVi1rS1VdPTOh0RJitemZPVdOgfWZ5gtIR0mrvSe21a4gzzPDsj50U3t6Y6pMEKW
         cjwQ==
X-Gm-Message-State: APuU4Z+qg/Nm/r1OEe+ucYzwzoqjwvk/wbMDK8/39XyaUxpfHx2o7/HV
	+eCN2Ha76GTjMqRxczaL6/+zai3B13PEemwLvvntxCFDU+Mi1e83x0el
X-Gm-Gg: AZFdTZdDJzUS7hwQBUwa/j3VHO1Xv9elzcUeBho7Dmbx/3aJg/GvVFQ1pCp4E002ZAq
	3dEdZX1rBhix9DychyFgIL+HCVqu1gxWoeYMyYVMgyG2FJljiTscqYLE/+JkglVPVpgFJkFw9tm
	uWccBYWoSFVARaWB4Jvj6MVXVBhTE+Xd4vh8DJp7jIHbjf9/oDmqBPcgRqVSG5oAyUT8lBO51yl
	Uhk9PCB5CG9mkXpiv4k9SqBOTk6kEmviEGWiQfNLLzq+16RT3nwU3kiKOYtl1LYFE4pjYw2KJzD
	VO8JG8KK+IeJbCdmIw+5L2Ot4BpjkFcsH30LShQK6FMMNJ+prE137ihPLTc2g0t+9v6x0aGIiel
	jMt1mcPtT9CRUcIuztZwOBlgN2Y9T8zvhWuwiYnw/n89zpGmoJMZpluOhL7r1OvZfE7r4Co6AMR
	epo6Nldzmk4d8SRgoUcjCGMeVJmPAjCw4ZriZXs92GY1LCY4JX3nqosajvN3Qjl67zttN8si+ba
	oS5h8PkRFvnHZZUvuG3rNbEzLS2TKXse6fiwQ6jUaJpl/30NHTMh26m22xB/A08UpqJPVX+Fw/k
	1sOda8sl0D6Dg0DRfEFKepA5rW7POyWl+iZ9IBx3c9B4+2xDD5c=
X-Received: by 2002:a05:7301:1884:b0:374:ba43:ae2e with SMTP id 5a478bee46e88-3856f65eccamr16725475eec.14.1795595103824;
        Wed, 25 Nov 2026 00:25:03 -0800 (PST)
Received: from localhost.localdomain ([103.179.230.77])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672ce402sm48576188eec.16.2026.11.25.00.25.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:25:03 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: tiwai@suse.de
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	sreekuttan2156239@gmail.com
Subject: Re: [PATCH] ALSA: Fix dynamic major number assignment
Date: Wed, 25 Nov 2026 08:24:40 +0000
Message-ID: <20261125082440.3841-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <87o6bd8ijb.wl-tiwai@suse.de>
References: <87o6bd8ijb.wl-tiwai@suse.de>
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

Hi Takashi,

Thanks for your review.

I've updated the patch according to your suggestions. It now rejects major=0 before 
calling register_chrdev() and removes the redundant major and cards_limit variables, using 
snd_major and snd_ecards_limit directly with module_param_named().

Please review the updated version.

Best regards,
Sreeraj
