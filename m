Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795186723;
	b=xC99jJzsEXlBNM3zdyAAuqzhxt2rDN0+IQvpdM0m443PBmULTJnI3F2amrzcrKvGFF5N
	 uC0DuyM9u/61O6gO+pYWSYd1eZfGFvb79EUSVItMH9G7038BhMJL+sHBvz1Vh45GC9pvH
	 S3XeHlcUL2BQjaclKE7m4p0JPilvSJJwhFFS7hy6VRFWFEB8xX56M+EVSRNRY/7yw76VA
	 nIl7biDpxmYByiuyQH7JP3dPK0eCVkb1P3cz+h9aTKTvFCpVnw75MAsD5nRl1oLNOW6iJ
	 0o+tL1Y4ATX9oehcHycVRD1gTmzpAZBf0x7npmPhdtIiKPVFGKVoHxPt3Wq6NPrtGug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795186723;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=zeppE7LVFpT4ixREhQAvnAo9EaUcYJOvEQxsnRwbRJA=;
	b=ymGmvt1w+d18Snf8WKEhV5ThrmH1ROJKiQeqWfnSDisz1k395XDkyqRfD+NLDK71hO0H
	 YDv1oFW9677xo4Gf85POQxdXHffUnvp2Y21OEoEvhv9R2ntFr2kMhUKn9jg2cZLdPc2Qy
	 ByZv+hAbh0hTXnY9Tfk9ruEH3neLPqfzcQUwNohoxTmZqUOTiRvT7BmdsHKHLefoiwAZk
	 HRH+KPViEvXCz9fGq1M57Gd9v1euyg7Qd4PWZ4husn2J9rEIdPe2jXDoBOK/G0WzbvPox
	 xWNcc/AzFFQf1m9I+W7ojCD/+tIq5Q9ctpt/CPOro8DhRybx7nu6OcB0xTi9K2hdolg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ePsBgp5F;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FD9760A2610
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 14:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ePsBgp5F
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE0AC1F00A3E;
	Fri, 20 Nov 2026 14:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795186723;
	bh=zeppE7LVFpT4ixREhQAvnAo9EaUcYJOvEQxsnRwbRJA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=ePsBgp5FAUdj2/X6RI3OZ6IrmPekwJ7PGtNkTO//lFReLTwWN0kEzheSMu0uzJeyw
	 JDja3r7Nh3LQc1cch7dLxKQmaPLRXxFONjCexpktIo5PxF8RTNfY0az2H30FFmmi8V
	 DW+4qqkw43bpnt+Syl327/rM27r2qcGidgKmZfqr6J4ANihcaNPP6oUDvFe7c3hCPN
	 4VK1BJ5L9OxtK6Jdct5Ov5gWMGPe3SCnXgxUlY/ZtBDmVetdt///ESap9iHE/gdO05
	 NydSw69opcKBIicvb4bzIInRKeVarWvt+1FbN8iAjC3Ovj8H46gqyNtjFcusQyM3h5
	 tYjeEgEJpSr2w==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Fri, 20 Nov 2026 08:57:43 -0600
Subject: [PATCH v5 19/19] accel: ethosu: Reject IFM broadcast on U65
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-ethosu-fixes-v5-19-52d459acdb84@kernel.org>
References: <20261120-ethosu-fixes-v5-0-52d459acdb84@kernel.org>
In-Reply-To: <20261120-ethosu-fixes-v5-0-52d459acdb84@kernel.org>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Oded Gabbay <ogabbay@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16-dev

IFM broadcasting is only supported by U85. Recording IFM_BROADCAST on
U65 lets a command stream reduce the dimensions used for IFM bounds
validation, or skip IFM validation entirely with scalar broadcasting.
The hardware does not implement that broadcast configuration.

Reject NPU_SET_IFM_BROADCAST on U65 rather than using an unsupported
register command to determine the memory accessed by an operation.

Fixes: 5a5e9c0228e6 ("accel: Add Arm Ethos-U NPU driver")
Closes: https://sashiko.dev/#/bug/linux-c74c700c-c823-4b8d-8c90-14842935cdf0
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
v5:
 - New patch.
---
 drivers/accel/ethosu/ethosu_gem.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/accel/ethosu/ethosu_gem.c b/drivers/accel/ethosu/ethosu_gem.c
index b4544298742f..928764de2e2c 100644
--- a/drivers/accel/ethosu/ethosu_gem.c
+++ b/drivers/accel/ethosu/ethosu_gem.c
@@ -1255,6 +1255,8 @@ static int ethosu_gem_cmdstream_copy_and_validate(struct drm_device *ddev,
 			st.ifm_upscale = param;
 			break;
 		case NPU_SET_IFM_BROADCAST:
+			if (ethosu_is_u65(edev))
+				return -EINVAL;
 			st.ifm.broadcast = param;
 			break;
 		case NPU_SET_IFM_REGION:

-- 
2.53.0

