Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794983274;
	b=y/OJ9YA6W+yfU7TCSWdyHwCoioCpsfmPuIap6Jj5dOnzBZs6yGJRPORXJqL1YIOQIbYF
	 7fHm+phBlTVpnew41U/3TvF1Eke8BOFstvLw60vf7nHxcsVHIxTXXDn6LUVLCB1xGH5Qh
	 voC/CkASKKjigmPNS+QUtRWmpiUoOimUFQt779wE8BxDf4Zx1tUFCgSBcO7DWeJKeuRqX
	 vVl0o5LMtK1NeBS+EgCuauOVHRVBvKXUPC5YoziGFNCAc/Ob6pV31pWmxxPQwbVyqOQRD
	 gI+XWwYlffiTWMrvP+nJyjabpv0hT9mOTdbIAQFGhcysYboovc2cMYIOF0zPDysNnsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794983274;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=u5Ctav/yDjXLRSHJvbAGfgAiHawDLtclHE70KW98KZA=;
	b=eRNR2agU/BHjOqaEsSLvnsYaW1JUxkbIihH/VgDFR04flG9FaU+/8Y6wl9yOjTo275/O
	 F2urjwH22nrNamFawzAIbUbrNQl6mb28DBZOUPWUPO6SDx3EDMQywQD4y9P92oTeLbqIe
	 Z8eTnuKh5UbCskog/PhqotTfXbMPbbq5ZlLWP+b/7AfYTS/Hq90CbWMH0b2x0rs/EfsDW
	 5l5Qsl2huZBA09pf2gglYL6ZWs9bsyFc5WReDg9H5US1/ENew1Uu5fkHNHPxb8pTkozm+
	 J8WNFWosB//H5dpNu6hn5Wj+dypo9GH/C8UVFlIpGXWQ6vZEOwCcBqiTZSfqHibAR+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WXeG34R6;
	arc=none smtp.remote-ip=209.85.215.176
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F695606A32F
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 06:27:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F695606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WXeG34R6
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cdb45e96d2bso440300a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 22:27:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794983272; x=1795588072; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=u5Ctav/yDjXLRSHJvbAGfgAiHawDLtclHE70KW98KZA=;
        b=WXeG34R6DDZWngdAiJaA7PHvZ+uKaDZCO7R75Gb/fZ5hR4hqnw+Oj05fyFYLPZ20aH
         lbxhyngcn0slgj164eujmb5/+SJC+8ah9Tennp1z0ZQ3ShlHv7Nr3QsQ4SPr9dl2JlZ8
         ogZVVmxe4pIimIDxBdPJ7Ev5355PJdJp97ovhBknNamNrmYhhK/SGJjxNb4gjOpvwCpq
         t9hd6TV4/OzNpS+/lUjU4QM8KWrgzA1VkT2iceUk5HB+c6kjU6pfzdSPP+C4fHNQr64a
         uqidN6z5JhYNhWASGiplpEFeVCNXuRFK5QyLHAC/1A0CIvrpq+XDyZqcCyky9HqyaRq5
         3LTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794983272; x=1795588072;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=u5Ctav/yDjXLRSHJvbAGfgAiHawDLtclHE70KW98KZA=;
        b=qu48YwV1nF3MKr7Ss8Y84ixl7ByDP0BUxd77zVf7GLDgP7Pxh+QLUZIMB6UYDx/5zA
         e9Nha6tLrzQqEo+qwxjTp6DvfKOR2/ttJTJkwRU8KdMOkdORBWLHhd4ER02HwTNLdFq2
         SmUO39Egkl7lCrX+OrYr9uPQDVweo6O/cVs9WM6nw9HyYknjO9ayWk1+qaCv4JFJwEvV
         GNrO8PztjRATFJwZcXc835FIUa6l50c8QsxunGLON9aO/i8SZacfIhtgDArYe2iMKV12
         SokdfBzi2fCUVCi07ZrwzRBDkVYwemtDaPwrk7eWpE+fYnm6xck+IpRYIkTQ/WqKwBQa
         hjoQ==
X-Forwarded-Encrypted: i=1; AL+hErHuDZRtg8QOKtajzTPHzLrcVX2qf4DO3D/GKVexUHRvJevGX9rn8ouBy37p35F/cuKvsrFP7yZMin4+ifY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8NEtXyCH0wEbT6csaPb4KvLpiCUlR4vIjZ/ycpVevOCQKSbp2Y
	ujSHizoX8Q3ony820Y7iv9+nBd3sXgUrwVbfLOuFv2sRHm79KxKCmw0q
X-Gm-Gg: AZFdTZdgY3oUTel2lcX/xmYUfXvL6IvvkxPVF8eEGyvOeUT/LzHmtMksmkrIh4OpAbf
	ITRGrHMK0n99YmBzHHOZan7Dx3JuRef7OlTKPmFOUIvhwFynFgfsOG9WKD/5/yPEIOG3vmvnQoU
	/dmfig1EGAyXMNLkQsxXA9/2fYCg5+CBrRPpR+bCciDPoZRhjaNNchdMP6JWMX+gjTtYSMYlSln
	iMd2gS75Kvx9OXAeJ8z1eSymkG/Mr6H3YWPQF/tWWzqbXKS7zaaPdipLgQQjAdUx7T2sDIGlXqS
	FOcsILA74FYL+A0U5i0rDqxJmckw+aU4UMLS4YySteIyCB8htLYaZj4BxAwdksDhk4iWvZ2evqb
	EYxmHAYOrYFbQx2s+KjpyEj06VR/KR6VGcmgp/W9TUKuFYEsS8jCd5bWHEvaOVf7WqvnZJ66JC0
	4/o9f16kVTZbH9wmX70IdLMB8oQOnHkguMmGn1BR6//ocoBUC5Y20b9Bf2lYnmD4cV6jlR9H7lg
	yrCbtHR4+fbE/liBk9uEEJ63qwFx1GAO+tq6Cwdc3S0ijEp8bJVXrf4djbF9sjz8+ASBx+UqByo
	qD4enTjPRy88eR5YYr1XZpHhD1Cu+JVZmYjr3Pbe8GLB9iEsg6PG6fAgzbv3JeZhsti91CAgdHi
	n6xdOeFE+DbxLDQJDKkN3y5AfDdvV1+kD2GH61Fi/WaQ3dwOgEk+hubNN
X-Received: by 2002:a17:90b:2d88:b0:3ae:8106:6074 with SMTP id 98e67ed59e1d1-3b3d07649c6mr1578634a91.16.1794983272450;
        Tue, 17 Nov 2026 22:27:52 -0800 (PST)
Received: from [169.254.3.1] ([143.248.188.96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d1acd118sm2576836a91.12.2026.11.17.22.27.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:27:52 -0800 (PST)
From: SeungJong Ha <engineer.jjhama@gmail.com>
Date: Wed, 18 Nov 2026 15:27:44 +0900
Subject: [PATCH net] net: release netpoll dev_lock when NETDEV_PRE_UP
 vetoes an open
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
Message-Id: <20261118-netpoll-preup-veto-v1-1-7d3fdf101d3a@gmail.com>
X-B4-Tracking: v=1; b=H4sIAF9F/WoC/yWMywrCMBBFf6XctQOdGiP6K+LC1qmOlCQkaRFK/
 91Rl+c+zooiWaXg3KzIsmjRGAx412B43sJDSO/G6NrOM/ORgtQUp4lSljnRIjXSye1bdxidZ9/
 DjlaN+v5JL7A9rv+wzP1LhvrVYds++xXTS3sAAAA=
X-Change-ID: 20261117-netpoll-preup-veto-943045f4616b
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Neil Horman <nhorman@tuxdriver.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, SeungJong Ha <engineer.jjhama@gmail.com>
X-Mailer: b4 0.15.2

When netpoll is attached to a device, __dev_open() takes
npinfo->dev_lock through netpoll_poll_disable() before calling the
NETDEV_PRE_UP notifiers, but returns without releasing it when a
notifier vetoes the open. The next attempt to open the device then
sleeps in down() with RTNL held, and every other RTNL user blocks
behind it.

For example, with netconsole on a wireless interface, cfg80211 vetoes
the open while the wiphy is rfkill-blocked. Release the lock on that
path, as the ndo_open() error path does.

Found by an AI coding assistant reviewing __dev_open(). Reproduced in
QEMU on an unmodified net tree with mac80211_hwsim built in and
netconsole bound to wlan0:

  ip link set wlan0 down
  echo 1 > /sys/class/ieee80211/phy0/rfkill0/soft
  ip link set wlan0 up    # fails: RF-kill
  echo 0 > /sys/class/ieee80211/phy0/rfkill0/soft
  ip link set wlan0 up    # hangs in D state:
    down
    __dev_open
    __dev_change_flags
    netif_change_flags
    do_setlink

With this patch the last command succeeds. Selftests were not run.

Fixes: ca99ca14c95a ("netpoll: protect napi_poll and poll_controller during dev_[open|close]")
Cc: stable@vger.kernel.org
Signed-off-by: SeungJong Ha <engineer.jjhama@gmail.com>
---
The fix just drops the lock on the veto path, the same way the
ndo_open() error path a few lines below already does.

I tested it in QEMU on net (297ae1590173) with mac80211_hwsim and
netconsole built in: the reproducer from the commit message hangs
without the patch and completes with it. W=1 allyesconfig and
allmodconfig builds are clean for net/core/dev.c.

The bug was found, and the reproducer and patch written, with Claude
Code (Claude Opus 5.5). I reviewed all of it by hand and re-ran the
reproducer myself.
---
 net/core/dev.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/net/core/dev.c b/net/core/dev.c
index 3c58db732761..0be9e78572ff 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -1748,8 +1748,10 @@ static int __dev_open(struct net_device *dev, struct netlink_ext_ack *extack)
 
 	ret = call_netdevice_notifiers_extack(NETDEV_PRE_UP, dev, extack);
 	ret = notifier_to_errno(ret);
-	if (ret)
+	if (ret) {
+		netpoll_poll_enable(dev);
 		return ret;
+	}
 
 	set_bit(__LINK_STATE_START, &dev->state);
 

---
base-commit: 297ae15901733df7562a6781613fb49f3d270401
change-id: 20261117-netpoll-preup-veto-943045f4616b

Best regards,
--  
SeungJong Ha <engineer.jjhama@gmail.com>

