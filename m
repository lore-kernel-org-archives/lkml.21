Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795089247;
	b=vpaiA1YErSzwnjBmsCLgR++V1KGm2WocaLg5y1NP1BFt128e2siXBD9Uc+dtTq2jbpjy
	 s9SJ39P93mfDGxHLzX/hSjqfjd/FwfQTTHYHbPIBWQkbDafwS6GdOQhoR9kG1kA6GXZ8r
	 mxu/kZM5vs6+5YGRu2ee7jBlClvaaHavpTs73WQfjCZuYvGoEYUNn8NPT6aQOd5XdYATE
	 wU5Uzq2gvZgT1Syh08BSRvjYTRfIfnSPBr+sgZOi/TWKZo6l2k1Opcs7eFDfE4Lu1s+YE
	 zvs2UBdrabKTRRy9CghL4TrP77K5wO7tX/0yIB3KXcJ+X71jHqC9knnZW4DCfVqUCUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795089247;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=bLOCauCwZS8/D6IGzsWIvkfLxH3srbuFeiLhXgqvy6U=;
	b=X3kTvhyMnz2x9FlCPPRXuywYGD22sr6boTSwJXpoQU+kfn7LM4qczhdNTWUB0ssbUWm4
	 DbphQI/i22ZlXF4VN/YQtlTW6dBCyyfOuyCMUp0GbIzGbFOX8/vhAkIcoY2A5nn2KHE7r
	 6NIaXi/tNllFnHkS5ES1h20HMPIMCRpNh/iCvE92eEo8GRAQMnvMakS1QAggF28DGYs7m
	 4Mhc8cXIzn5nW5ZDo6OXnoAZVVl14/qtqn2FWDHEwanp1AiiAUQMqsVTVVtaqMjP9XZLS
	 2NAj/AsnZ5NofZ+gZquayCyiOWyMvz04vQnfWHqUGs7D8adeaUsedyLjUhsynxT+38g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cNYaOTjn;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FD4E606A325
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 11:54:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4FD4E606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cNYaOTjn
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-382f4710a17so2901479eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 03:54:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795089246; x=1795694046; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bLOCauCwZS8/D6IGzsWIvkfLxH3srbuFeiLhXgqvy6U=;
        b=cNYaOTjnvzS1pEK0uRVMoCyx28ithK4lvHu9jpiNgASRoorUYcaPa1ce7CBliZzUvi
         ENvJADmySvn1nE3O1xTJpr1IW+0qmLVGDwZktIYtiGp2H1eVMfBvxDcKsAeprfR1eXV8
         DQI8YDy/JC1bqEWBO7Hlr56Wn4m9Eqw+vwy3vQNXLGLXSa25PYIdIgl2XEl0k6Pq+U9I
         rKrYxp12LhiIH20QdtGLkXb2TYXLyyr3pwo0khnu15YotGCVJCGzVphRUSJsqPHSCfRi
         Gl17jPX5MWEGtpPSgGmdB5d/RvguH8uwjhy+5ut0N6M6sw+RvsV4wbi/gm83GXbZ8ZiN
         TvzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795089246; x=1795694046;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bLOCauCwZS8/D6IGzsWIvkfLxH3srbuFeiLhXgqvy6U=;
        b=mjqsECRVnls7yz+Pgqpgut5sRLdNrAY1Xkeme+6xwq6mAOP9SeVKBDOvwHGQnqCQlk
         5EcZFbur5GG9OH2vsOAyC6dUYbJ9HOuEGBeUQpMMaMr0X1a4AVnZO5RUIP7i2kyZHfQo
         vpv2uVj/s7PkdGpAyzHaK2wOtup8NqNsrzgBVS55T9Slpz3SAvy0DccV5plefHW7g+QZ
         1UHS77LJgAwRHjG3x+x+4PAf1c5pX9WbigwJlWWYl2OsZsW52xtskl6I0mzS8q9f14gP
         SWwEnxTPoQeEGQ4d2r0tDjQl8qMnJ+aAyfyENQcMQC/EVZXVB58LzHtXXspXf0g+TIbQ
         FKDg==
X-Forwarded-Encrypted: i=1; AL+hErHg1JvU595HnZTPVGtkyYVn1Ih/SD7YgE4iuyO0fpITScnZxDqz3vGB+ppZQgxXQG1hh0oFszI8TO624uU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+2wcOrwZ6lIlQ9ZKI2tYiMwv9klbN3LHT5xmM2KIKn88hP1VpL
	0/exhOfi1ewZG0WK6bWmWVlBR6yR5AQnsQ/0nqEiVEa3BhH61I5Ni2fJ
X-Gm-Gg: AZFdTZeSLfmAdrOT315OP0yBH7IGGdsuDbAIXfV0dDg6SRiqoThvln3BHBJJNLiz26W
	L5/kod3feTxSFE+W3pZfzx8wUvS0IMH3oVi2d7jog6wYd19Qr4gRFs7A7HDUIuccqxBXokQig8Z
	FVsYz2FhiQAFeQ9xqMITPXNNM13WbaE7DkiTgvrSl0gYX84E+m8lvwdDx4Hv+MDT2HkMRFBLE/1
	u+fUIan4KJe/whx0s+kRtLZcXfCrX8AN4IrINZ971Ux3SViIDXbDAIYu8GvJIKhW2BhvYOQuzX6
	E58wnURFAd7VreCtoeW3Su2BhZVQzEztpbZTkuP4swtZBRwx/zn6PwsR7E8FYWTDqnvsuqVD/Vu
	3E/SXgQF73hJ8x0TXUUfhAUm9ug5eDr9mUXapTOKDP7PPKffk4OfvLebrd13tHjO4/XBtkqeq28
	0woJpVO8b/Bs9bHUD/WRyUk1BT2xTnGhbirKVfX4jufx/5eL37CJG40ViW7+ijvTZfjjqNsJtkc
	mg97n/e6aihUdSQRNJWMBF8TjRTlynJ1k6B/QhoCnsfcs7Uvh/Hj8YCDsd9IwYfkT78vkG9njKA
	HVOzWMrfo5K8saPo0ItYRi+qH9sGGwM7KQE=
X-Received: by 2002:a05:7300:d117:b0:372:32a1:b384 with SMTP id 5a478bee46e88-38281a0669amr5299111eec.33.1795089246055;
        Thu, 19 Nov 2026 03:54:06 -0800 (PST)
Received: from DESKTOP-NM9EKIA ([2001:e60:8509:ba6c:11e:f696:8454:757])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a6304ff2sm17199286eec.6.2026.11.19.03.54.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 03:54:05 -0800 (PST)
From: Joonhoe Kim <26rote@gmail.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: Re: [PATCH v9 00/29] drm/msm/dp: Add MST support for MSM chipsets
Date: Thu, 19 Nov 2026 20:54:05 +0900
Message-ID: <20261119115405.162-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <20261119-msm-dp-mst-v9-0-ca61be4edfc3@oss.qualcomm.com>
References: <20261119-msm-dp-mst-v9-0-ca61be4edfc3@oss.qualcomm.com>
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

On Thu, 19 Nov 2026, Yongxing Mou wrote:
> Add support for Multi-stream transport for MSM chipsets that allow
> a single instance of DP controller to send multiple streams.

Hi Yongxing,

On v7 I reported that s2idle hangs on resume with MST active, and you
said I could send the fix. I will not have time to follow it up as a
separate patch, so here it is for you to take into the series if it is
useful.

The series never calls drm_dp_mst_topology_mgr_suspend() or
drm_dp_mst_topology_mgr_resume(). While MST is active the link is kept
up after the last stream is disabled, so system suspend powers the
controller down with link_ready still set; on resume the first stream
enable skips link training, and the payload table write hangs retrying
AUX over a link that is down.

The fix suspends the topology manager and takes the link down before the
controller is suspended, and on resume initializes the PHY again and
resumes the topology manager (turning MST off with a hotplug event if
the branch device is gone). The version on top of v7 of this series is
here:

https://github.com/joonhoekim/tb323fu-linux/blob/0e73bc96d65386bee31cc003f2e76a2e9623f631/kernel/patches/0202-drm-msm-dp-suspend-and-resume-the-MST-topology-acros.patch

With it, a Lenovo Y700 Gen 5 (TB323FU, Kaanapali) with two displays on
an MST hub resumed from s2idle 3 times out of 3. On v9,
msm_dp_display_unprepare() should move into the patch's
msm_dp_mst_suspend() and run under mst_lock, as
msm_dp_mst_stream_post_disable() holds that lock when it calls it. If
post_disable starts taking the link down after the last stream
(Sashiko's comment on 18/29), only the topology manager suspend/resume
part is still needed. Feel free to take it under your own name or keep
my authorship.

Thanks,
Joonhoe Kim
