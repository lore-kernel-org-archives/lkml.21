Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795416038;
	b=ILetPJYWX8xQsgus7uIXruavqCy4vBQaq7WA8748Y1brc7WNJ4IKhGPwFtuvDRdg3Muh
	 bWD+vjSYu3qtInmwZhLKNdgQ4Lvj2P8FVUFb9Wj9RwTyTCVLNLYFeLcy1cVnoV078fJ57
	 HneuBBZqqHDEkeM+oeNnyx3y9PVqEsUb+WGoraJWLrx3gUFyHjoLMNmHqE36uPfiTWhiw
	 IAIpPr3BcMh6Bp0v8Kw1FP+Mw//dPXQTZXD6BoZbvKfHZcXFMsIL4MHYt92VDWhm6AJaW
	 hAc2U3IQu8GNhM95kc1KB4O+i1DNCo1WKZIjiqHi1YUdJCQHsDsYiT+2XHHCEX45b3Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795416038;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=f4a8zFdSHZW0pYRFKYGvDhkp+r4/xiv4IAwtu7E955w=;
	b=ic1ukeYixl+wep626ziqQXQO+5DDiBsEcg30L6YrujihNUL49ZMEN2SyxiKdohkuPsVw
	 MVqsgkjLbXpZMMz3oik7DHHWV0JRpZAt145tngLnmS+JA2ouZ1aR1KYt5vlcDs02qW9sB
	 b8tqBzO4V2/1r5Wt0xbDfsTMzv9BdvfJuy4wwfpAQz6mFFgQjFzzDwuK7w0Dx1twwMhv/
	 rpOSOhuTC3EzdvhGCmf4GOMNSplfRfUEoSguRRoF4aWPhm7+P69ts+dqGB1dySJzKiUwG
	 cvyWUnVZ2GG0xMWJguAgPC2B4bTqwJprd8c/DbTmtGcvgvKC8R7ndQWAVyn6PzJahOg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="tj7oNz/g";
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4308A606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 06:40:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4308A606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tj7oNz/g
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1aefd1bf74aso1109968c88.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 22:40:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795416037; cv=none;
        d=google.com; s=arc-20260327;
        b=NBN7T5coJx+J60A7C6drdy7MgiSu/sl9XNIop/OmaoYoZKVe6nSIonw/ejc1yDhgL9
         6RZ94my71XwcKhCrvxVpJmetoxrQqs7QxuKThqSUWVb4x6nCM+T/VhFuu7E8iBB6W66u
         7pOXpGGLqibxkJ8aX19sTC28aPhOXGbxy8qIiPZ6bzfFt7eUTFRp976Km6d2eKg3X71J
         tv9l61Vaa6Jzggu6BIWhXO1oXToiyJzAe7OzOcGikURwwte5j9R3QCiCv5Ek69c4E09U
         e18DetQjr3w3QzZI+Bw63YBZVGPO0Dg02zMYMikFZTYzaR2JyARt5mRVpVHeu0GwTqwK
         DIDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=f4a8zFdSHZW0pYRFKYGvDhkp+r4/xiv4IAwtu7E955w=;
        fh=sPYRFAgggXIBfaM3xqcgG9yBquw5I7BW6Zy2AVzTKIc=;
        b=Mfa7cdJ3kYEMUQtT0ilm3OKtlRP5+eVc1atGQvdqFyWhZJXbnyEwVaT0FxHwMy4aIV
         PENtbOKx/dgYAMnbfXf78iuumJKj/ML9R9brE6uI3RtkUknXOAR0Y9EySxP+dpb8o+BG
         S772AMRd7kg7Lo9CiFH81/itmI09Xbc3CWP2m7La1Iq18L8XxE9f+GJTGcJGkl5qJ6GA
         xW9fCRNoDVE4r0GAled+SGyqvGamsnmhitgVaY/h+G/0wAl2b1XtSkVe6jFsIZn8UzOF
         FhYwqUKHLro5uSduTTG3rnAB+fsDdOkfeBzsJQaqA2/ASTLiRihIupxxnSK112l0PXQS
         Xijg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795416037; x=1796020837; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=f4a8zFdSHZW0pYRFKYGvDhkp+r4/xiv4IAwtu7E955w=;
        b=tj7oNz/geF/WMXYxTdQF8S73V971uV/32Yq0koMbSYdL/PioOpHn9SOBzqOlqUljxR
         8ssbWO7m06sjuxD7HxI7bNAULBrMuiu9iy0BKjrA+YNVRlDDan1yRAoJUklSqaifEZ3w
         deQAbjFhMSsBlsXexIFRTdNB/uArYZjbPGOd9N6v4ii37VMLx5LeKoIj7bvDeK+nNKfb
         gzY77YNZTvfMsKYY61cw4NpGoa9OsSWbybgZqWzuys5/Zd7KevJLcfziwsFg8FRwMtf1
         H5pDmahyoil88gCFeziexDgRA5VoG1aPlfqmpZXxx5tVSz4+f990JEqm/DVhaYQ5Xq46
         i4sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795416037; x=1796020837;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f4a8zFdSHZW0pYRFKYGvDhkp+r4/xiv4IAwtu7E955w=;
        b=ZdILWmx+Dh0bAgUT2R8ZSjm4TO0DfCquC8M5aEHpaINUOoYBGw5kaEZBEd7qpY74S8
         RhXURFf5+Et5tf84oL8FHHnpwrmXZxZTU7uvpcipIn0agTg8Io3N6kuGdEuY7j6rpFSp
         oUMQuZkzV90VqVwXm/0v0ol1eDk6NSsVvmep6p6PSVoqyNPJIqEP/9ZCeM5EfLVrh4EG
         A4KfFTWFXzWEzwvV+TlRQnE3/cKapYBc0HPPmjgSzTDEouXQ5lLTloL2eii93HhEbKvT
         UgV5RQ1oEUisTGxkAZr+9XdWo6OGHHRiiJM4/eNKi8z+jgPcc9MqhFmVcAa6myk1xLA4
         VOqw==
X-Forwarded-Encrypted: i=1; AL+hErFbphUb+IksyoPT/s+MdB3PHgb2/ambVM10Cn8ZnO4ojZt3JGZ5cRYmdJb47Ttc6z1qfZ9tgovQTgGTt/I=@vger.kernel.org
X-Gm-Message-State: APuU4Z/PcvOaMJCKUYqbHytxa5BMEoDPqlr+hJd2uzs0rwmU+eSE0j5k
	lOoGamJaViHEhz3+XGfrJBvyYcpcRF/XfkiH7a2W7zeUnLkwyafDt9ijcV/R9myGcmAYTQUEEpg
	JTyO6mBXST1EDQbDmNMJTROfjGMuUBOw=
X-Gm-Gg: AZFdTZeGHvEz/7uXuWt3v/asJCpDC5VEHzsNDyuC0UWyJFz/JzheZThnlpvNP4Y4ltx
	qMCsdWkp7UFmL0MJaWfq2rXbKCHGG6ta8XEkZAqkrerV7N9nXPECDG65/jbCHTH4HECuv1Xy90n
	paNveTyfUsCAw2n79pwTrUYJwxvkqzyA2+bp7BNkCFqjib5m3x/6mHx80s+To5ECDGciJhmYsd/
	rH4zQ3IkOZcxpoTx7zuBSaMnfdou2O8d01JlAZvViAbKzZ1Q37zPuFfRtPoxUc1E01cv85zQdN+
	JkohKUn6zx2JiUFHJdj75W814nBU7ydlPU+SsMN8i9RbxQ05QTQ3KEQsRckEp8z/9ZfaRPi9E6D
	/MKWSlHMAxJnVsf8vmzDeb7ozNn/N7pQEHnsC
X-Received: by 2002:a05:7023:a41:b0:1b2:67f9:43cb with SMTP id
 a92af1059eb24-1b5525e786cmr12124036c88.17.1795416037296; Sun, 22 Nov 2026
 22:40:37 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261120210317.184756-1-kapoorarnav43@gmail.com> <179526830578.567.7445109567862298713@viennaoffh.gmail.com>
In-Reply-To: <179526830578.567.7445109567862298713@viennaoffh.gmail.com>
From: Ayaan Mirza Baig <ayaanmirzabaig85@gmail.com>
Date: Mon, 23 Nov 2026 12:10:25 +0530
X-Gm-Features: Aa3M54pKXHh6UQF7oq3WN8ub3J8erT3GSETIT8vxp_X3pViFXm3_QiDK3Y4XRHU
Message-ID: <CAJi8Lv-orD3VA1NJ71L1Qcw6=AWuBZesVFOHe5Y+bwzWxT8KRg@mail.gmail.com>
Subject: Re: [PATCH v2] HID: hid-sensor-hub: avoid lock inversion in sensor_hub_remove()
To: Zheng Shuhao <viennaoffh@gmail.com>
Cc: Arnav Kapoor <kapoorarnav43@gmail.com>, Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <bentiss@kernel.org>, 
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, Jonathan Cameron <jic23@kernel.org>, 
	Lee Jones <lee@kernel.org>, Heiko Stuebner <heiko@sntech.de>, linux-input@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzbot+fb951970a334aaff00ba@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Zheng,

I'm fine with merging the fixes into a single version. I've just now
read the other mail thread.
If you can, please send the v3; else let me know and i'll do it.

Thanks,
Ayaan



On Sat, Nov 21, 2026 at 7:08=E2=80=AFPM Zheng Shuhao <viennaoffh@gmail.com>=
 wrote:
>
> Hi Ayaan,
>
> Hmm, I overlooked the latest discussion, which caused some overlap betwee=
n our patches. Sorry for the confusion.
>
> We can merge the fixes into a single version or find another compromise. =
Either way works for me.
>
> Thanks,
> Zheng
