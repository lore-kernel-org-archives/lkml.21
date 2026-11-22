Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795315208;
	b=PoGOjE2tOiidpgggtEdaTXmufoSzheH9NdBsfwpUOlnGZth8QGTE3q9+/xvGgntggi9J
	 IUgIdCXW1U1rwkUlAytkDM5Yg/giUjGkiwffTZ0ruu2wiW2rSCulmcoyNjvvJ0xQz8j/I
	 jEvjVNnwT9nHr6K2nfQDBWJ1Et/1OL086AvkZ8nS3v99qYJCxkMApT2LPC4XPqK4WIJ4h
	 x9VfH8xpYIc4M35OtEVU+0ScxlMbb7A9oHVYAB2T6SlOGRSJkFtFiVJLV3rG9aYBgYMqB
	 DmUlYTuMMa0twws40D1LD7dCX+tYTCnwcDlN2NMqbIjRsZ6pj53BHCho/mOoRyAxRyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795315208;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=PKya3YxXvPxdPz7Z0C1z6SRKNYNaf8lxnWH3lx3F6Ek=;
	b=Uw3hKH4Ut4Ppwm057fGZk80WR3UxGpOOtl2Sejdby+7Zh9C/IJLq3lnhS18tk9Pueeav
	 G+Rjq8xuNNQ1NHpvQXQIKHxh9X8bj3TLDyi/noJkFGCcQV24KbjxWiNMocENNJ7ZreItV
	 br+hgY0x5c5A0Lu63hC7HigaPK+JaJrMs4ZXjhUllCILTC6lFBenonfO6Eds0F1nHFVUi
	 vFPc/TAUPu/dXNpHBB8WMTrYTcY3Rihw0JXvQFkbFAWAqsyf4E4SYA0ZQTYk+hmdbXkKa
	 qbYDE6ul7d51k7Z0INM88hXhgiPAtQ9Nh765Xw9dJGX5JEjxe8h0SHZtJ8gako/AN2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mswin.me;
	spf=none smtp.mailfrom=mswin.me;
	dkim=pass header.d=mswin-me.20260707.gappssmtp.com header.i=@mswin-me.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=nMNK5Ugl;
	arc=none smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 452CD606A32C
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 02:40:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 452CD606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mswin.me
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mswin.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mswin-me.20260707.gappssmtp.com header.i=@mswin-me.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=nMNK5Ugl
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c247f6687dcso327015266b.2
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 18:40:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mswin-me.20260707.gappssmtp.com; s=20260707; t=1795315205; x=1795920005; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PKya3YxXvPxdPz7Z0C1z6SRKNYNaf8lxnWH3lx3F6Ek=;
        b=nMNK5Uglm3oSjscVzrRVwYpVzwUcFeqH+R9VCWRiY03isTCMYcCfLyfN6aoOLdTq3z
         rpOUbiiz/Y6TIT4y5YnwKh/6iJd3DJP0FfCWAAZPwbvx8j7HikkKC7e9DRegNFuYeDwY
         /JV2B1O1YcXy6xxMmQIlcsHxgXrP5pavTdPcLJEukIYO10xfHtBb7t6UimVQ24i0izuC
         cCROVhvbNXk5NLVPgnZUSxZL3dEb+nxktf8aDfiYuBR5qxF0RP8+O2jdrz02vjllVHMP
         hTjRloH4GbNOB19H7RL5gusClYBLQ6tNGTatl59RZBCG0RvpzhbBnixNQuiEEY1KWdu6
         Y3kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795315205; x=1795920005;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PKya3YxXvPxdPz7Z0C1z6SRKNYNaf8lxnWH3lx3F6Ek=;
        b=wCa+rk/sXvWoxfyzvLHCScFOJh8RYC3q9OVTfuRnC5QL6/8lTpFid1qHJJJVBrJ85b
         y04YJqyv/FzVVH/atDpplrNOrW5D0iXqYOyAOmQ7FPjsg9wS83h/izo50rqOr9HF7f62
         lv3u4GovQ/aBcYQu50HWsVJeoxLKLztuHrQtaZ3wWlOLWqTNZvVKY8daZ5c6RqAX+D5E
         2Fm3iK9Uut8q7UJQGq4hYA94oJeGatkb/AwlybseyxneUAvT2OqD4pG98+ZazOm4Duvi
         dD9FSA7keDmEvR7/fkvwmPPVBUeoWtYgN9OVTZhtWUA1XMoc5kiSXtPXb4rIUIO6Vvgr
         R93Q==
X-Forwarded-Encrypted: i=1; AL+hErHv07dDEjHGtbHfrVDzwUo+BamEFMvUQ/cpVHG9Wxy8Y3NBbtZVpglMeG5XIeZHC5kldPojxE2YvPVJgso=@vger.kernel.org
X-Gm-Message-State: APuU4Z87RYKVzqj9Se6t7U7xzlfas1A5v0NFEnL8sg9B3A6cTxXFrz3j
	Y0BYlMJm/Pzndcb3VK541yKUaybuBxqOrnH61Ge1b9yZzcJ287uQli876sboQglseMc=
X-Gm-Gg: AZFdTZeWnVCHZvWS7g709OD6OCwiW+hOpHvzcGe+Wl4ZkOKwuuwEuhLeMe8UDGKajSV
	YYLTvscf/CPjhfkBQhAzExZ3KpGYtCbB0/fQHFxXndoa3HiyzpA5/OmgEZ3rU6qysqDpqabNUeT
	KwQP3SjJNkE1JCJwMQ+0ZABQqPUF3gKNrGE2dplBxXYYbDp6+Ad5GGHuWB1aNcY9v3gXpQ5EWmC
	b//t2f1n9XKkH2pPAmynmtqHHIRS5J/FqrJOvM4eWXiDya767UxoDNNpFg3+85yQaBEIsY+9Jq0
	gJd9vNbSch6CyI3sKkHosxHQuSwlnzYswlzN/7Zy54Ps/yYBzlhie088Uj9oZ6AVgqLkyjk3GBT
	+VRddrDRKzPpHmfQ3O++xWGme63U9Bc7TeosBU6Lg1ICCK4CV81wKXVXtcT2c2hSAaWMJd2drUX
	8LOVCWDXTqvwxtQm909cKPZGi9qUOCQ9IxesPAp8nx0KnP7eKlLPU+5UqYjHn1jveY0oZ4Afkn0
	5fiMeA9eJsTZkfZZ7O/4jDr4X90vGutgcg37QofunnyB6r1GgECC3ZVZJBqrqSHMGG+/jXdAIvG
	e1qGFPv6RTOPriF+o5dD0Xx3n9kpm+lBbbPR
X-Received: by 2002:a17:907:a890:b0:c41:55b4:d88b with SMTP id a640c23a62f3a-c513ab14402mr690249566b.43.1795315205485;
        Sat, 21 Nov 2026 18:40:05 -0800 (PST)
Received: from zephyr.int.serkovo.ru ([95.135.208.171])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae68788sm258432866b.29.2026.11.21.18.40.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 18:40:04 -0800 (PST)
From: Roman Linev <admin@mswin.me>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] clk: qcom: dispcc-sm8250: Don't park mdp_clk_src at registration
Date: Sun, 22 Nov 2026 05:40:01 +0300
Message-ID: <20261122024001.375239-1-admin@mswin.me>
X-Mailer: git-send-email 2.56.1
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

Parking disp_cc_mdss_mdp_clk_src at registration time breaks the EFI
GOP framebuffer on the HUAWEI MateBook E Go 2022 (gaokun2, SC8180X):
the panel goes dark as soon as dispcc-sm8250 probes and stays dark,
while simpledrm keeps rendering into the framebuffer.

Use clk_rcg2_shared_no_init_park_ops for disp_cc_mdss_mdp_clk_src, as
was done for sc8280xp and x1e80100, so registering the clock no longer
reconfigures it. The firmware framebuffer then keeps working until the
display driver takes over, as long as its other resources (MDSS_GDSC,
the MDP branch and the display PLL) stay enabled.

Tested on gaokun2 with an out-of-tree DT whose simple-framebuffer node
holds MDSS_GDSC, dispcc-sm8250 built as a module, and clk_ignore_unused
pd_ignore_unused on the command line. With the patch the panel stays
lit; without the patch the panel goes dark (v7.4-rc3 and v7.3-rc2
based kernels). Built-in dispcc-sm8250 and the unused-clock sweep were
not tested. This driver also serves sm8150, sm8250 and sm8350; only
sc8180x was tested.

The cause was localized and the change tested with the help of an AI
coding assistant (Anthropic Claude).

Fixes: 01a0a6cc8cfd ("clk: qcom: Park shared RCGs upon registration")
Signed-off-by: Roman Linev <admin@mswin.me>
---

Notes:
    Testing (HUAWEI MateBook E Go 2022 LTE, SC8180X, booted from USB via GRUB
    with an out-of-tree gaokun2 DT; Ubuntu userspace, GNOME on simpledrm):
    
    The DT describes the EFI GOP framebuffer as a simple-framebuffer in
    /chosen with power-domains = <&dispcc MDSS_GDSC>; without that holder
    MDSS_GDSC is powered off at dispcc's genpd sync_state, which also
    blanks the panel independently of this patch. With the holder in place
    and dispcc-sm8250 loaded as a module (deferred_probe_timeout=30 so
    simpledrm binds after it; clk_ignore_unused pd_ignore_unused on every
    boot, so the unused-clock sweep never ran), each pair differs only in
    this one line:
    
      kernel                   stock dispcc-sm8250    with this patch
      v7.4-rc3                 panel black            desktop visible
      Ubuntu 7.3.0-15 (rc2)    panel black            desktop visible
    
    In both black cases the kernel log shows simpledrm bound to the DT
    framebuffer, MDSS_GDSC on and GNOME rendering (KMS readback of the
    framebuffer shows the desktop), but the physical panel stays dark from
    the moment dispcc-sm8250 probes. Only the sc8180x path was tested.
    
    Prior art: Val Packett's downstream linux-qclaptops tree carries the
    same one-line change for the Surface Pro X (commit 88aee348d602, "mostly
    for sc8180x"); I came across it while researching the issue, next to
    the merged sc8280xp/x1e80100 fixes it mirrors, and did not find it
    posted to linux-clk. This report is from a different device, the HUAWEI
    MateBook E Go 2022 (gaokun2), where the failure looks different:
    MDSS_GDSC is held on by a simple-framebuffer node and scanout still
    stops. The tests above isolate the parking as the cause on two kernels.
    
    Tool use: an AI coding assistant (Anthropic Claude) was used to
    compare this driver with the sc8280xp/x1e80100 fixes, build the test
    kernels/modules and analyse the boot logs; the change itself is the
    one-line ops swap from those fixes. All hardware observations were made
    by me on the device.

 drivers/clk/qcom/dispcc-sm8250.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/dispcc-sm8250.c b/drivers/clk/qcom/dispcc-sm8250.c
index dc62eb18de..4a94b4c5a9 100644
--- a/drivers/clk/qcom/dispcc-sm8250.c
+++ b/drivers/clk/qcom/dispcc-sm8250.c
@@ -564,7 +564,7 @@ static struct clk_rcg2 disp_cc_mdss_mdp_clk_src = {
 		.parent_data = disp_cc_parent_data_5,
 		.num_parents = ARRAY_SIZE(disp_cc_parent_data_5),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_shared_ops,
+		.ops = &clk_rcg2_shared_no_init_park_ops,
 	},
 };
 

base-commit: fbfe0c4beecfbd0e2958d91e5c95ff189bc489a0
-- 
2.56.1

