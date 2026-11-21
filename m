Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795233347;
	b=2DqXFjGFgSnKo05xOpSlI25Iw7JAlM6S+mDdWOJjBbEkZFUKQkOxPNbG/JHjCBU9TrHg
	 sYWkfyREww7VrHk+U24Rl0qQv6ZkRQCS7AqHi1N71YA0VLJ7BaWrmVQwUVn5qGUezwK4c
	 SYQvXcqg51Vd1lPrjl1rD7Nit1hhBBfIl0GRJJhRShIJ8rlOdJrg85SOWIeb2uBqPpS/c
	 IQAuivDWYjtu5uIqrPF8A5SruH1hAoP23o4JcgXQueruGeiUPTiC9x0++ZMkO5RzrBtr7
	 XxVoq6/fbGf5cDSrfrZLwCrylQkUEmC4r6ALAy86gUab6sckkEry/KIFAhOT0FPISEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795233347;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=4zJLU7TV4OK6TSVsIiKHn0bV6zmnjofg1PwBOjuNmRA=;
	b=W06y/nO1YNuvZSc4nEjXV/l2y52a7AEuMHfPLTxuil311Lf7NSvWr6paAI9ScQypkAEG
	 NA4fvpsodyly1h0WZI+f/kj4wuHiAKPq+gpHBlTuwgR3Ymc6nvzwGdoz9TTF2fKZ9WFDg
	 8VsFVcGUdzuTUhQUvOLfHyvnIF2ydw5U5d6hsFCBID3cs4R54sWnA7gmAQDFucKxfwktE
	 Jn0wkx0K3dr18FyDOaJJrDIno76uj9Hos/+EXHva8tsbLx+RxfzEdbySFv2BZFeiYJAaZ
	 E0Plxv1spoKjw88r0MbcvhosBUhzjDl9FBj+eNhpiJpk7ikngnSzikx1xVCHC30TnmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YPalnPgr;
	arc=none smtp.remote-ip=209.85.161.51
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5AD2606A6BE
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 03:55:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5AD2606A6BE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YPalnPgr
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-702dedeb70dso1021017eaf.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 19:55:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795233345; x=1795838145; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4zJLU7TV4OK6TSVsIiKHn0bV6zmnjofg1PwBOjuNmRA=;
        b=YPalnPgrFTJrmqQNuFZXEBMnkOL5fJganovUfgw37I6U3eVfJfSu/EJMW/r/ptkiWM
         JuKw8XBwwJ4JmieONT28MymFBceHvD8Jvpgm8OVg86vSwned/LBLsJ0B+Po1f5niK7Ed
         AJNNK616YS6oRg/UzEYFk2QTRyWFPsCy6kKFxwcD9PfUJNKQt29vkGuTQSwf25SPYRD0
         NI4wOv1nAx/xK10+DVjX17/NRB/g+6VxudPsBQ4u0MNyeK2hkqCMNfPHSfQ8OoiYn4q2
         n3OOnqOtklVALiFuE6lPeBvnSBqvROTMq8u/pm0nxW6xfIv2QOTUuh5z3CJLE/gQ9XUq
         oA9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795233345; x=1795838145;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4zJLU7TV4OK6TSVsIiKHn0bV6zmnjofg1PwBOjuNmRA=;
        b=fMvK03FA903J2ICrIbRj4YhzDnOrUep66Ks/QwBznMiTlgW6j6EVUireQmoivdHP6V
         He7GgpkIW2F4/3lsE0snG08I2MposuATtUAo43r+qQmdABmFQsBRVpwyQBvuHzJ+0GRu
         grtilPEnv53x1lhSJSS8UoIr3ZAIZHO3jueQ1t6h65JrvlbsQ56GgOMZVKhQR4E5GAIY
         K2dgtfT4TqqRHPYJlFPjLDbk4VmSyHMNItdLVOyHQcLT+jThRIqt2clNV9eWQaRMAAkq
         39GsEbEKRMv9eBt6Fi3lhSvvJgUMD43PJLbGhyDHKvhksd4/6i6thnUHkWopclRWMMVg
         VyVg==
X-Gm-Message-State: APuU4Z/je6tR03xlufoZJNALigctiSXoBjoxxeyia2PXKM4FImks2jm7
	bx7E78wRcrRyVVoTX9PONOzHpFy2ePoTruMzmB2UOT7gwX7nA9yyhsY=
X-Gm-Gg: AYBFou0dtJ2EoDE7XkrVDXQgVJUDZ3JZQBnSfgyhOZ3HqUh19KbuYKuUZ95QZNgTwNz
	/DE24/5mfZWNG6fEG/xPss7z0ozORQS1EPehEjsmGoLL5fAVOZzZ4HeP+/hP8jn/OSny9C202Ie
	6MkwJdzjI6CeKteOOcWwrKpsDpxds/KuTwH9v6EgNT+pJ90db+NiKWVF7GSzuvwaTrfFSr3lF9f
	i8Tf/rkEQOWzxWq+pkENHhXtUDP7Kp7sUuAL++Gers4ddIZ0wmBaXTrzajWvUbaNmYRHupPMaUV
	BPThcZc22Ep81ZXo9QzSTTrte40Hd2YWtSycqS5x41M/Y38MvV5CzmSGk8cRWAxzz0mK0e3k0wI
	SEjS8P4Ztez/i5H/XklWWkxMNPVXr5nzM/Y06O0QxDuxAXV76HGbropEpod60z2NxROzLHl8c2w
	dajtiW5wBmi9ddHKSo/C0SrZJGEDbLpOYZcZ5asv5DIQbNOVV+cTUDL5i2iKLYaFKSuySH4/NNJ
	79Rh6a+bxXTgkAPGALWtAhe7egXf0RF5Wi8JEIDszANoiBgfzLoXYUlERi73tY1ftLNCvk3zWqd
	M97xKOGAEKgg6k6NpIPTubXrISqe5nuL64EeUp9Ci14PnYnbEeAC/Mbj
X-Received: by 2002:a05:6820:c5d0:20b0:71a:f794:49b5 with SMTP id 006d021491bc7-71b395c1759mr2894179eaf.89.1795233344780;
        Fri, 20 Nov 2026 19:55:44 -0800 (PST)
Received: from miso.lan ([136.62.61.36])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b380b6f82sm2878076eaf.10.2026.11.20.19.55.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 19:55:43 -0800 (PST)
From: Matthew Laux <matthew.laux@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Mehdi Djait <mehdi.djait@bootlin.com>
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Matthew Laux <matthew.laux@gmail.com>
Subject: [PATCH v7 02/12] media: tw9900: release the device when stopping the stream fails
Date: Fri, 20 Nov 2026 21:55:13 -0600
Message-ID: <20261121035523.26764-3-matthew.laux@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261121035523.26764-1-matthew.laux@gmail.com>
References: <20261121035523.26764-1-matthew.laux@gmail.com>
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

If writing the register to stop streaming fails, the error path dropped
the runtime PM reference but left tw9900->streaming set. Then, s_stream(0)
again would drop the reference again and unbalance the usage count. At
that point any s_stream() is ignored because the driver thinks it's
streaming. Always clear the streaming state and drop the reference, and
only report the error.

Fixes: 918b14a26b12 ("media: i2c: Introduce a driver for the Techwell TW9900 decoder")
Signed-off-by: Matthew Laux <matthew.laux@gmail.com>
---
 drivers/media/i2c/tw9900.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/tw9900.c b/drivers/media/i2c/tw9900.c
index e07924faa84b..e9d384039b50 100644
--- a/drivers/media/i2c/tw9900.c
+++ b/drivers/media/i2c/tw9900.c
@@ -303,14 +303,14 @@ static int tw9900_s_stream(struct v4l2_subdev *sd, int on)
 
 		ret = tw9900_write_reg(client, TW9900_REG_OUT_FMT_CTL,
 				       TW9900_REG_OUT_FMT_CTL_STANDBY);
-		if (ret)
-			goto err_unlock;
 
 		tw9900->streaming = on;
 
 		mutex_unlock(&tw9900->mutex);
 
 		pm_runtime_put(&client->dev);
+
+		return ret;
 	}
 
 	return 0;
-- 
2.47.3

