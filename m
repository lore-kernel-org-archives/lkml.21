Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.204.34.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795428627;
	b=FyHYvm82DAxpr5thvwoVUXKbrKf7Q0R/inbgYKttmCek2k5wsdP8eI5y72UPwX6Fk8uq
	 SiAVAM9kEst3Sqit7Qm2rAU1bZR7DT7ZkMthw1x/myp0QnBt+4nGy/Ikhx/K2sKCha/hP
	 v/FRv0c2r3bHjNw/eXZvqh4Qg9nJp2VvD/CqcQPSqPRVNq8AxT1NeEuinUvM0TTWCfcvR
	 VzAsvlNxFlISh+ToQ08dtv+g4JF4WTBCeZTUXGBoBgtgFkc9pPW7H/L+LycsYnK5NvUCt
	 iiQldRPr5Lmg8MaSmzOz9tXd4lFxPaBQu8mDB0JmJ9ycNTrWZ0msfVTBkxxnpWUwOVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795428627;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Cc:Subject:
	 From:To:X-Mailer:References:In-Reply-To:X-QQ-SENDSIZE:Feedback-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=na+Qx5lxtdWvhLfCjtLB7gxG8BYD2XnZIK8peOF3Fyg=;
	b=GY4r6KW7wjzEH2qNGICGe6ON9jSliybGwmJZyRMEt0oip4MjoqX2s5pEhlRENCV2Cjrm
	 kjf4Bm1wgUiDYRu5LIyFlanq3yiTr/KU/61GYC0sIgRgqZ08Q+f0yInJYJhewUSMbVs6w
	 y15ziE8cUFXu8z7yFVmaUS9HGVIcvo0LQeyO7x6wMq7Pbe3W5K+thWdt19DQYTZ3OtBv1
	 s8ggR4EzppxL7d62iYVxSWAonIqp62eO0q/1GJDsMptihYStrHlnjR5igK0h9fcGmMH8d
	 +5odtquAWFyx73rOvbVXSgTRmdEVNgq3lDMxgAnpy9vQi7tCxIDXDAy3VqkiJHGogJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	dkim=pass header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=dxBPOEcT;
	arc=none smtp.remote-ip=54.204.34.130
Received: from smtpbguseast2.qq.com (smtpbguseast2.qq.com [54.204.34.130])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45207606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 10:10:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45207606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=dxBPOEcT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1795428544;
	bh=na+Qx5lxtdWvhLfCjtLB7gxG8BYD2XnZIK8peOF3Fyg=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=dxBPOEcT822N9MS9+7+GDLXAz0TzccONkfaGXR7+gWQjIAPSzqiuxM1TR3UhG2jkR
	 cwOE0aOcxn4dulG93a3CP/ghSNnpjVqzFm20iJBaB5NMLGNLqrXrs82bt3YOBp5lgn
	 41LtHZxS5d5a1cLAuWBGP3DCzGaFVAURceEYZCbY=
X-QQ-mid: esmtpsz21t1795428537t55d3ec12
X-QQ-Originating-IP: YRM8rmCD4m2EOmelJpoSAkd6C+Zo71Ofh6RWgSJHJN0=
Received: from localhost ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 23 Nov 2026 18:08:54 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 6646035375502222729
EX-QQ-RecipientCnt: 19
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Nov 2026 18:08:54 +0800
Message-Id: <DN2IAQ05SK22.2BFO0AZF4IAH6@linux.spacemit.com>
Cc: "alessio.belle" <alessio.belle@imgtec.com>, "luigi.santivetti"
 <luigi.santivetti@imgtec.com>, "maarten.lankhorst"
 <maarten.lankhorst@linux.intel.com>, "mripard" <mripard@kernel.org>,
 "tzimmermann" <tzimmermann@suse.de>, "airlied" <airlied@gmail.com>,
 "simona" <simona@ffwll.ch>, "dlan" <dlan@kernel.org>, "troy.mitchell"
 <troy.mitchell@linux.spacemit.com>, "pjw" <pjw@kernel.org>, "palmer"
 <palmer@dabbelt.com>, "aou" <aou@eecs.berkeley.edu>, "alex"
 <alex@ghiti.fr>, "imagination" <imagination@lists.freedesktop.org>,
 "dri-devel" <dri-devel@lists.freedesktop.org>, "linux-kernel"
 <linux-kernel@vger.kernel.org>, "linux-riscv"
 <linux-riscv@lists.infradead.org>, "spacemit" <spacemit@lists.linux.dev>
Subject: Re: [PATCH v2] drm/imagination: re-check firmware idle state before
 runtime suspend
From: "Baihui Liang" <liangbaihui@linux.spacemit.com>
To: "Gyeyoung Baek" <gye976@gmail.com>
X-Mailer: aerc 0.17.0
References: <20261111-img-pm-autosuspend-v2-1-427689f6f2f9@linux.spacemit.com> <CAKbEzntsUc4D3Nvxfphy5yApWG+sGsx7VF1cYd3SLSoZKhiteA@mail.gmail.com>
In-Reply-To: <CAKbEzntsUc4D3Nvxfphy5yApWG+sGsx7VF1cYd3SLSoZKhiteA@mail.gmail.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: OKrvsjP4PrxvitNSYHKY3k1dVsxkzvcI7C2b1nwa+lhfvt0cyA90Rixi
	+Z25tPoHkzZGBI92vYs8iTv9bh5x74iSpIhyPAIM4EWr1wnY6lqHC4Kaq/eafPv9gsbOi7g
	DjYqsNPZCHzvDaieFPCvo2WsE/zTp2xVrVnn93Y2l7Dc5TS4WM0jWKZD2UqAlBhT48WtWd8
	bXUloIHfss5sRQ+yFRzr6o5ECDglT41kc6yCZdbASRKZmhNiir91LirJBsqLBs7BF28R0/S
	Ao2eJOv6ye4u8wiL+tNmCHxedAvWTZ3jAr2X0gMqnXlneUWXKMdD1znZExB4e8CM+lSI9JZ
	pXEzZ7nDC6EJGRoaM1wBhmhqLf4W6ocPyl54LsS65sToMXlPVe09453UVba4MpGAcOtNHAM
	au6EHGDCIUBSXpdcDFtZoU4L+r/ir/MhCI5WlTxMskdNHrJkxqQHoUZsAEqLL9UlzZse0bS
	2wpp0K4i+STC8XmWlEojN4QY5qdtG9OdFSA/LCHrc9dc/V/7Xdh3qE792YYIn9vRF2Pz7Cy
	KxqoABXb4p2AceVCNVgtSimAQ4Mri743Cx96KulVe0J5gscKYi7YF90WsBACHPGd9sCe8Cm
	xNPm//PVImtyQ0gNRIl6LYN+SHk0bU8rtFd7Bx10qpvbHfbwKR6Sw2HIRkkAoyas9O3WHnb
	nRypopyu/MRq9QU+XJvjHGiEfvw7b92DrEpA/u1ETuUdjFfCsULvgCALaE6L6ZASMWHAHUL
	r663OuLG1vW9fUKAz4lwANJw1hN3x04BCCRH8+LKaQUHdigj495AHRz0xksFEcxmfTDw5Ur
	DYYZnse6hsbBUjyel+2/ZS/hx+2JfI3ruwXSoPDJPABySxTEbdHPfZVMXr4Urs3WzMAnJXV
	7hfDE9F/WocYwclayTvu2CgaVQ/Cs0Q5bQyA9Lyf/oV/9RnL0ZDsAUjIL+jDz1kzVXvgkoD
	evlgocu8998inPdwybGYW6cKq8P0Yn/hN841T7BfjzQCbV3hcP5XVGIXcYBIGL7TcQsbjnj
	Cx3zG29rUwf+udkb8lZgds1X2kvWot/ZQss9sYHXwRSPZVsEpV
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
X-QQ-RECHKSPAM: 0

On Sun Nov 22, 2026 at 1:57 AM CST, Gyeyoung Baek wrote:
> Hi Baihui,
>
> On Wed, Nov 11, 2026 at 6:29=E2=80=AFPM Baihui Liang
> <liangbaihui@linux.spacemit.com> wrote:
> >
> > pvr_power_device_idle() rejects runtime suspend while the firmware
> > hasn't reached ROGUE_FWIF_POW_IDLE. The PM core doesn't reschedule
> > idle notification after rejection, so no further pm_runtime_put()
> > arrives on an idle GPU and the device stays powered indefinitely.
> >
> > Move the idle check into pvr_power_device_suspend() and return -EBUSY
> > after pm_runtime_mark_last_busy() so the PM core reschedules the
> > autosuspend timer and retries until the firmware is idle.
>
> My understanding of Sashiko's point (correct me if I'm wrong):
>
> - pvr_remove(): must power off unconditionally
> - runtime suspend: power off only once idle (-EBUSY otherwise)
>
> Since remove goes through the suspend callback, it can now skip the
> power-off on -EBUSY.

Exactly right.

> Moving the idle check into runtime suspend looks right to me, so how
> about keeping just the power-off logic in a common helper, called by
> runtime suspend after the idle check and by remove directly? Roughly:
>
>   pvr_power_device_off()        /* fw_disable + power_off */
>
>   pvr_remove()
>       pm_runtime_disable();
>       if (!pm_runtime_status_suspended()) {
>           pvr_power_device_off();
>           pm_runtime_set_suspended();
>       }
>       pm_runtime_enable();      /* balance devm_pm_runtime_enable() */

Agreed =E2=80=94 that's the shape I ended up with: a common power-off helpe=
r called from runtime suspend after the idle check, and from pvr_remove() w=
ith runtime PM disabled around it.

Thanks,
Baihui
